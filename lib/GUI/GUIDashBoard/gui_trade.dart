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
  TradeView({super.key, required this.index, required this.symbol});
  final int index;
  final String symbol;
  // final DataCandle c;
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
                                // _PriceLabel(
                                //     market: market, index: widget.index),
                                // _IntervalButtons(
                                //     tradeViewModel: widget.tradeViewModel),
                                Chart(candle: candle),
                                // _InfoBody(candle: candle),
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
}
