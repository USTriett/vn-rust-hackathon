import 'dart:convert';

import 'package:vn_rust_hackathon/GUI/GUIComponents/gui_history_item.dart';

import '../DTO/dto_history.dart';

class DataHistory {
  static Future<List<DTOHistoryItem>> GetHistoryData() async {
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = '''
    [
      {
        "name": "Deposit 1",
        "cash": 100.0,
        "token": 50.0,
        "type": "deposit",
        "startTime": "${DateTime.now().subtract(Duration(days: 1)).toIso8601String()}",
        "endTime": "${DateTime.now().toIso8601String()}",
        "balance": 150.0
      },
      {
        "name": "Withdrawal 1",
        "cash": 200.0,
        "token": 100.0,
        "type": "withdraw",
        "startTime": "${DateTime.now().subtract(Duration(days: 2)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 1)).toIso8601String()}",
        "balance": 300.0
      },
      {
        "name": "Deposit 2",
        "cash": 300.0,
        "token": 150.0,
        "type": "deposit",
        "startTime": "${DateTime.now().subtract(Duration(days: 3)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 2)).toIso8601String()}",
        "balance": 450.0
      },
      {
        "name": "Withdrawal 2",
        "cash": 400.0,
        "token": 200.0,
        "type": "withdraw",
        "startTime": "${DateTime.now().subtract(Duration(days: 4)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 3)).toIso8601String()}",
        "balance": 600.0
      },
      {
        "name": "Deposit 2",
        "cash": 300.0,
        "token": 150.0,
        "type": "deposit",
        "startTime": "${DateTime.now().subtract(Duration(days: 3)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 2)).toIso8601String()}",
        "balance": 450.0
      },
      {
        "name": "Withdrawal 2",
        "cash": 400.0,
        "token": 200.0,
        "type": "withdraw",
        "startTime": "${DateTime.now().subtract(Duration(days: 4)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 3)).toIso8601String()}",
        "balance": 600.0
      },
      {
        "name": "Deposit 2",
        "cash": 300.0,
        "token": 150.0,
        "type": "deposit",
        "startTime": "${DateTime.now().subtract(Duration(days: 3)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 2)).toIso8601String()}",
        "balance": 450.0
      },
      {
        "name": "Withdrawal 2",
        "cash": 400.0,
        "token": 200.0,
        "type": "withdraw",
        "startTime": "${DateTime.now().subtract(Duration(days: 4)).toIso8601String()}",
        "endTime": "${DateTime.now().subtract(Duration(days: 3)).toIso8601String()}",
        "balance": 600.0
      }
    ]
    ''';
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<DTOHistoryItem> items =
        jsonList.map((item) => DTOHistoryItem.fromJson(item)).toList();
    print(items);

    return items;
  }
}
