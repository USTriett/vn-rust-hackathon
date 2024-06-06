import 'package:flutter/cupertino.dart';
import 'package:vn_rust_hackathon/Business/business_dashboard.dart';
import 'package:vn_rust_hackathon/DTO/dto_dashboard.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/GUIDashboard/gui_record.dart';

class AllCoinModel with ChangeNotifier {
  List<GUIDashboardRecord> items = [];

  bool isupdated = false;

  int updateTime = 0;

  Future<void> fetchAllData() async {
    List<DTODashboardItem> dtoItems = await BSDashboard.GetAllCoinInformation();
    if (dtoItems.length == items.length) return;
    items = [];
    int count = 0;
    for (var item in dtoItems) {
      items.add(GUIDashboardRecord(index: count++, tab: 0));
    }
    isupdated = true;
    updateTime++;
    notifyListeners();
  }
}

class HotCoinModel with ChangeNotifier {
  List<GUIDashboardRecord> items = [];

  bool isupdated = false;

  int updateTime = 0;

  Future<void> fetchHotData() async {
    List<DTODashboardItem> dtoItems =
        await BSDashboard.GetAllHotCoinInformation();
    if (dtoItems.length == items.length) return;
    items = [];
    int count = 0;
    for (var item in dtoItems) {
      items.add(GUIDashboardRecord(index: count++, tab: 0));
    }
    isupdated = true;
    updateTime++;
    notifyListeners();
  }
}

class NewCoinModel with ChangeNotifier {
  List<GUIDashboardRecord> items = [];

  bool isupdated = false;

  int updateTime = 0;

  Future<void> fetchNewData() async {
    List<DTODashboardItem> dtoItems =
        await BSDashboard.GetAllNewCoinInformation();
    if (dtoItems.length == items.length) return;
    items = [];
    int count = 0;
    for (var item in dtoItems) {
      items.add(GUIDashboardRecord(index: count++, tab: 0));
    }
    isupdated = true;
    updateTime++;
    notifyListeners();
  }
}
