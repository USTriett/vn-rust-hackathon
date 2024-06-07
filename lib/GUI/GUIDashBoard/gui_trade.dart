import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:vn_rust_hackathon/Data/data_candle.dart';
import 'package:vn_rust_hackathon/Data/data_market.dart';

import '../../DTO/dto_candle.dart';
import '../../DTO/dto_market.dart';
import '../GUIComponents/GUIDashboard/gui_chart.dart';
import '../GUIComponents/gui_app_bar.dart';

enum LottieEnum { onboard1, loading, onboard2, onboard3, appLogo }

class TradeView extends StatefulWidget {
  TradeView(
      {super.key,
      required this.index,
      required this.symbol,
      required this.currentPrice});
  final int index;
  final String symbol;
  final String currentPrice;
  final List<Candle> initialData =
      DataCandle.generateInitialCandleData(DateTime(2024, 1, 1), 30);

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // const BackgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: StreamBuilder(
                  stream: DataMarket.UpdateMarketData(5),
                  builder: (context, AsyncSnapshot marketSnapshot) {
                    return StreamBuilder(
                        stream: DataCandle.UpdateCandle(
                            widget.symbol, widget.initialData, 5),
                        builder: (context, AsyncSnapshot tradeSnapshot) {
                          if (marketSnapshot.hasData && tradeSnapshot.hasData) {
                            List<Market> market = marketSnapshot.data;

                            List<Candle> candle = tradeSnapshot.data;
                            return Column(
                              children: [
                                GUIAppBar(symbol: widget.symbol),
                                _buildPriceLabel(
                                    market: market, index: widget.index),
                                // _IntervalButtons(
                                //     tradeViewModel: widget.tradeViewModel),
                                Chart(candle: candle),
                                _buildInfoBody(candle: candle),
                                // _TradeButtons(
                                //     index: widget.index,
                                //     symbol: widget.symbol,
                                //     tradeViewModel: widget.tradeViewModel,
                                //     marketViewModel: widget.marketViewModel,
                                //     walletViewModel: widget.walletViewModel)
                              ],
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Center(
                                child: LottieBuilder.asset(
                                  "assets/loading.json",
                                  height: 80,
                                  width: 80,
                                  repeat: true,
                                  animate: true,
                                  controller: _animationController,
                                  onLoaded: (p0) {
                                    _animationController.forward();
                                  },
                                ),
                              ),
                            );
                          }
                        });
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceLabel({required List<Market> market, required int index}) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: const Text(
              "Current Price",
              style: TextStyle(
                // overflow: TextOverflow.clip,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: Colors.white,
                ),
                Text(
                  market[0].lastPrice,
                  style: TextStyle(
                    // overflow: TextOverflow.clip,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 60,
                  height: 40,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // side: BorderSide(
                          //   color: Colors.red, // your color here
                          //   width: 1,
                          // ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        (!market[0].priceChangePercent.startsWith('-')
                            ? Color.fromARGB(255, 74, 175, 74)
                            : Color.fromARGB(255, 175, 74, 74)),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    child: Text(
                      market[0].priceChangePercent + "%",
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBody({required List<Candle> candle}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _informations("Opening Price", candle.last.open.toString()),
          _informations("Close Price", candle.last.close.toString()),
          _informations("High Price", candle.last.high.toString()),
          _informations("Low Price", candle.last.low.toString()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Column _informations(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "\$$value",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
