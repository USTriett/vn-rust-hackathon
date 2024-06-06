import 'dart:convert';

import 'package:vn_rust_hackathon/DTO/dto_dashboard.dart';

String jsonDashboardData = '''
[
  {
    "coinType": "BTCUSDT",
    "amountUSDT": "6.546B USDT",
    "amountUSD": "70,776.90 USD",
    "derivativePercent": 2.33,
    "tag": "hot"
  },
  {
    "coinType": "ETHUSDT",
    "amountUSDT": "1.810B USDT",
    "amountUSD": "3,807.59 USD",
    "derivativePercent": 1.04,
    "tag": "hot"
  },
  {
    "coinType": "SOLUSDT",
    "amountUSDT": "909.261M USDT",
    "amountUSD": "172,520 USD",
    "derivativePercent": 3.80,
    "tag": "hot"
  },
  {
    "coinType": "NOTSUDT",
    "amountUSDT": "700.469M USDT",
    "amountUSD": "0.021234 USD",
    "derivativePercent": -11.36,
    "tag": "new"
  },
  {
    "coinType": "BTCUSD",
    "amountUSDT": "643.468M USD",
    "amountUSD": "70,775.50 USD",
    "derivativePercent": 2.31,
    "tag": ""
  },
  {
    "coinType": "1000PRPRISDT",
    "amountUSDT": "523.133M USDT",
    "amountUSD": "0.014310 USD",
    "derivativePercent": -0.57,
    "tag": "hot"
  },
  {
    "coinType": "BNBUSDT",
    "amountUSDT": "351.839M USDT",
    "amountUSD": "701.15 USD",
    "derivativePercent": 8.45,
    "tag": ""
  }
]
''';

class DataDashboard {
  static Future<List<DTODashboardItem>> GetDashboardAllData() async {
    await Future.delayed(const Duration(seconds: 1));

    List<dynamic> jsonList = jsonDecode(jsonDashboardData);
    List<DTODashboardItem> items =
        jsonList.map((item) => DTODashboardItem.fromJson(item)).toList();

    return items;
  }

  static Future<List<DTODashboardItem>> GetDashboardHotData() async {
    await Future.delayed(const Duration(seconds: 1));

    List<dynamic> jsonList = jsonDecode(jsonDashboardData);
    List<DTODashboardItem> items =
        jsonList.map((item) => DTODashboardItem.fromJson(item)).toList();

    return items;
  }

  static Future<List<DTODashboardItem>> GetDashboardNewData() async {
    await Future.delayed(const Duration(seconds: 1));

    List<dynamic> jsonList = jsonDecode(jsonDashboardData);
    List<DTODashboardItem> items =
        jsonList.map((item) => DTODashboardItem.fromJson(item)).toList();

    return items;
  }
}
