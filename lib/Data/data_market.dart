import 'dart:async';
import 'dart:math';

import '../DTO/dto_market.dart';

class DataMarket {
  static Stream<List<Market>> UpdateMarketData(int intervalSeconds) async* {
    Random random = Random();

    while (true) {
      await Future.delayed(Duration(seconds: intervalSeconds));
      List<Market> marketDataList = coinLogos.map((symbol) {
        String lastPrice = (1000 + random.nextInt(10000) / 100)
            .toStringAsFixed(2); // Random price between 1000 and 1100
        String priceChangePercent =
            ((-5 + random.nextInt(10)) + random.nextDouble())
                .toStringAsFixed(2); // Random percent between -5 and +5

        return Market(
          symbol: symbol,
          lastPrice: lastPrice,
          priceChangePercent: priceChangePercent,
        );
      }).toList();

      yield marketDataList;
    }
  }
}
