import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vn_rust_hackathon/DTO/dto_dashboard.dart';
import 'package:vn_rust_hackathon/Data/data_dashboard.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/GUIDashboard/gui_dashboard_notifier.dart';
import 'package:vn_rust_hackathon/GUI/GUIHistory/gui_history_notifier.dart';

class BSDashboard {
  static List<DTODashboardItem> allItems = [];
  static List<DTODashboardItem> hotItems = [];
  static List<DTODashboardItem> newItems = [];

  static Future<List<DTODashboardItem>> GetAllCoinInformation() async {
    // await Duration(seconds: 1);
    allItems = await DataDashboard.GetDashboardAllData();

    return allItems;
  }

  static Future<List<DTODashboardItem>> GetAllHotCoinInformation() async {
    // await Duration(seconds: 1);
    hotItems = await DataDashboard.GetDashboardHotData();
    return hotItems;
  }

  static Future<List<DTODashboardItem>> GetAllNewCoinInformation() async {
    // await Duration(seconds: 1);
    return newItems = await DataDashboard.GetDashboardNewData();
  }

  // DTODashboard  here
  static String GetCoinType(int index, int tabIndex) {
    switch (tabIndex) {
      case 0:
        return allItems[index].cointType;
      case 1:
        return hotItems[index].cointType;
      case 2:
        return newItems[index].cointType;
      default:
        return allItems[index].cointType;
    }
  }

  static String GetAmountUSDT(int index, int tabIndex) {
    switch (tabIndex) {
      case 0:
        return allItems[index].amountUSDT;
      case 1:
        return hotItems[index].amountUSDT;
      case 2:
        return newItems[index].amountUSDT;
      default:
        return allItems[index].amountUSDT;
    }
  }

  static String GetAmountUSD(int index, int tabIndex) {
    switch (tabIndex) {
      case 0:
        return allItems[index].amountUSD;
      case 1:
        return hotItems[index].amountUSD;
      case 2:
        return newItems[index].amountUSD;
      default:
        return allItems[index].amountUSD;
    }
  }

  static double GetDerivativePercent(int index, int tabIndex) {
    // print(index);
    switch (tabIndex) {
      case 0:
        return allItems[index].derivativePercent;
      case 1:
        return hotItems[index].derivativePercent;
      case 2:
        return newItems[index].derivativePercent;
      default:
        return allItems[index].derivativePercent;
    }
    // return -11.36;
  }

  static String GetTag(int index, int tabIndex) {
    // print(index);
    switch (tabIndex) {
      case 0:
        return allItems[index].tag;
      case 1:
        return hotItems[index].tag;
      case 2:
        return newItems[index].tag;
      default:
        return allItems[index].tag;
    }
  }

  static int GetNumberRecord(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return allItems.length;
      case 1:
        return hotItems.length;
      case 2:
        return newItems.length;
      default:
        return allItems.length;
    }
  }

  static int GetNumberTab() {
    return 3;
  }

  static String GetHeader(int index) {
    switch (index % 3) {
      case 0:
        return "All";
      case 1:
        return "Hot";
      default:
        return "New";
    }
  }
}
