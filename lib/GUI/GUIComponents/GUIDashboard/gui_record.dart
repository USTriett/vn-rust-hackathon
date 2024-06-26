import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vn_rust_hackathon/Business/business_dashboard.dart';
import 'package:vn_rust_hackathon/GUI/GUIDashBoard/gui_trade.dart';

class GUIDashboardRecord extends StatefulWidget {
  const GUIDashboardRecord({
    required this.index,
    required this.tab,
    Key? key,
  }) : super(key: key);

  final int index;
  final int tab;
  @override
  State<StatefulWidget> createState() => _GUIDashboardRecordState();
}

class _GUIDashboardRecordState extends State<GUIDashboardRecord> {
  int get index => widget.index;
  int get tab => widget.tab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TradeView(
                      index: 0,
                      symbol: BSDashboard.GetCoinType(index, tab),
                      currentPrice: BSDashboard.GetAmountUSD(index, tab),
                    ))),
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(100, 0, 0, 0),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                // name, tag and USDT
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            BSDashboard.GetCoinType(index, tab).substring(
                                0,
                                min(
                                    10,
                                    BSDashboard.GetCoinType(index, tab)
                                        .length)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              // overflow: TextOverflow.clip,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            BSDashboard.GetTag(index, tab),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(146, 245, 186, 99),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        BSDashboard.GetAmountUSDT(index, tab),
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(150, 200, 200, 200),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // USD
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          BSDashboard.GetAmountUSD(index, tab),
                          style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          BSDashboard.GetAmountUSD(index, tab),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(150, 200, 200, 200),
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Derivative Percent
                Expanded(
                  flex: 5,
                  child: Container(
                    width: 90,
                    height: 50,
                    padding: EdgeInsets.only(right: 5),
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
                          (BSDashboard.GetDerivativePercent(index, tab) > 0
                              ? Color.fromARGB(255, 74, 175, 74)
                              : Color.fromARGB(255, 175, 74, 74)),
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      child: Text(
                        BSDashboard.GetDerivativePercent(index, tab)
                                .toString() +
                            "%",
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
