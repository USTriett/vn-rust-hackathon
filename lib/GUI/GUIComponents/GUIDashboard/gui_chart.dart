import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../DTO/dto_candle.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.candle});
  final List<Candle> candle;

  @override
  Widget build(BuildContext context) {
    var zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enableMouseWheelZooming: true,
      enablePinching: true,
      enableDoubleTapZooming: true,
    );
    return SizedBox(
      height: 320,
      child: SfCartesianChart(
        trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.longPress,
        ),
        zoomPanBehavior: zoomPanBehavior,
        onChartTouchInteractionUp: (tapArgs) {
          zoomPanBehavior.zoomOut();
        },
        backgroundColor: Colors.black12,
        plotAreaBorderWidth: 0.6,
        plotAreaBorderColor: Colors.greenAccent,
        borderWidth: 0,
        borderColor: Colors.transparent,
        series: <CandleSeries>[
          CandleSeries<Candle, DateTime>(
            dataSource: candle,
            xValueMapper: (Candle data, _) => data.x,
            highValueMapper: (Candle data, _) => data.high,
            lowValueMapper: (Candle data, _) => data.low,
            openValueMapper: (Candle data, _) => data.open,
            closeValueMapper: (Candle data, _) => data.close,
          ),
        ],
        primaryXAxis: DateTimeAxis(
            interval: 10,
            dateFormat: DateFormat.Md(),
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(color: Colors.transparent),
          opposedPosition: true,
          enableAutoIntervalOnZooming: true,
          labelStyle: const TextStyle(fontSize: 10, color: Colors.white),
          majorTickLines: const MajorTickLines(size: 2, width: 0),
          majorGridLines: const MajorGridLines(color: Colors.white, width: 0.2),
          minimum: (candle.last.low! - (candle.last.low! * (1 / 30))),
          maximum: (candle.last.high! + (candle.last.high! * (1 / 30))),
          interval: (((candle.last.high! + (candle.last.high! * (1 / 6))) -
                  (candle.last.low! - (candle.last.low! * (1 / 6)))) /
              60),
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 3),
        ),
      ),
    );
  }
}
