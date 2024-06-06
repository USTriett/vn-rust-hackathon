import 'package:flutter/material.dart';
import "package:syncfusion_flutter_charts/charts.dart";

class GUIHistogram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GUIHistogramState();
}

class _GUIHistogramState extends State<GUIHistogram> {
  final List<BTCData> chartData = [
    BTCData(DateTime(2024, 1, 1), 30000, 32000),
    BTCData(DateTime(2024, 2, 1), 31000, 33000),
    BTCData(DateTime(2024, 3, 1), 32000, 34000),
    BTCData(DateTime(2024, 4, 1), 33000, 35000),
    BTCData(DateTime(2024, 5, 1), 34000, 36000),
    BTCData(DateTime(2024, 6, 1), 35000, 37000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <CartesianSeries>[
          // Renders bar chart
          HiloSeries<BTCData, DateTime>(
              dataSource: chartData,
              xValueMapper: (BTCData sales, _) => sales.date,
              lowValueMapper: (BTCData sales, _) => sales.low,
              highValueMapper: (BTCData sales, _) => sales.high)
        ]))));
  }
}

class BTCData {
  BTCData(this.date, this.low, this.high);
  final DateTime date;
  final double low;
  final double high;
}
