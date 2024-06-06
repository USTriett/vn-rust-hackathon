import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vn_rust_hackathon/Business/business_dashboard.dart';

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
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(50, 0, 0, 0),
      ),
      child: Center(
        child: Container(
          child: Row(
            children: [
              // name, tag and USDT
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            BusinessDashboard.GetCoinType(index, tab),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            BusinessDashboard.GetTag(index, tab),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(146, 245, 186, 99),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        BusinessDashboard.GetAmountUSDT(index, tab),
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
                        BusinessDashboard.GetAmountUSD(index, tab),
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Text(
                        BusinessDashboard.GetAmountUSD(index, tab),
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
                        (BusinessDashboard.GetDerivativePercent(index, tab) > 0
                            ? Color.fromARGB(255, 74, 175, 74)
                            : Color.fromARGB(255, 175, 74, 74)),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    child: Text(
                      BusinessDashboard.GetDerivativePercent(index, tab)
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
    );
  }
}
