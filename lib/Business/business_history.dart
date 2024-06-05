import 'package:vn_rust_hackathon/DTO/dto_history.dart';
import 'package:vn_rust_hackathon/Data/data_history.dart';
import 'package:vn_rust_hackathon/GUI/GUIComponents/gui_history_item.dart';

class BSHistory {
  static Future<List<DTOHistoryItem>> GetHistoryItems() async {
    return await DataHistory.GetHistoryData();
  }
}
