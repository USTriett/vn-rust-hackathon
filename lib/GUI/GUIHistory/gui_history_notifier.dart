import 'package:flutter/material.dart';
import 'package:vn_rust_hackathon/DTO/dto_history.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/gui_history_item.dart';

import '../../Business/business_history.dart';

class HistoryModel with ChangeNotifier {
  List<HistoryItem> items = [];

  bool isupdated = false;

  int updateTime = 0;

  Future<void> fetchHistoryData() async {
    List<DTOHistoryItem> dtoItems = await BSHistory.GetHistoryItems();
    if (dtoItems.length == items.length) return;
    items = [];
    for (var item in dtoItems) {
      items.add(HistoryItem(item));
    }
    isupdated = true;
    updateTime++;
    notifyListeners();
  }
}
