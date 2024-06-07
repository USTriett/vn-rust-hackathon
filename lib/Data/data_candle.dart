import 'dart:async';
import 'dart:math';

import '../DTO/dto_candle.dart';

class DataCandle {
  static List<Candle> generateInitialCandleData(DateTime startDate, int days) {
    Random random = Random();
    List<Candle> candles = [];
    DateTime currentDate = startDate;
    num lastClose =
        1000 + random.nextInt(1000); // Starting price between 1000 and 2000

    for (int i = 0; i < days; i++) {
      num open = lastClose;
      num high = open + random.nextInt(100);
      num low = open - random.nextInt(100);
      num close = low + random.nextInt((high - low).toInt());

      candles.add(Candle(
        x: currentDate,
        high: high,
        low: low,
        open: open,
        close: close,
      ));

      lastClose = close;
      currentDate = currentDate.add(Duration(days: 1));
    }

    return candles;
  }

  static Candle generateNextCandle(Candle lastCandle) {
    Random random = Random();
    DateTime nextDate = lastCandle.x!.add(Duration(days: 1));
    num open = lastCandle.close!;
    num high = open + random.nextInt(100);
    num low = open - random.nextInt(100);
    num close = low + random.nextInt((high - low).toInt());

    return Candle(
      x: nextDate,
      high: high,
      low: low,
      open: open,
      close: close,
    );
  }

  static Stream<List<Candle>> UpdateCandle(
      String symbol, List<Candle> initialData, int intervalSeconds) async* {
    Random random = Random();

    while (true) {
      await Future.delayed(Duration(seconds: intervalSeconds));

      Candle lastCandle = initialData.last;
      Candle newCandle = generateNextCandle(lastCandle);
      initialData.add(newCandle);

      yield initialData;
    }
  }
}
