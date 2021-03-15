import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/data/repositary/DatabaseRepositary.dart';

class CallLogsViewModel {
  var _dataSource = DatabaseRepositary();

  void insertCallLog(CallHistoryModel log) {
    _dataSource.insertCallLog(log);
  }

  Future<List<CallHistoryModel>> getCallLogs() async {
    List<CallHistoryModel> logs = await _dataSource.getCallLog();
    return logs;
  }
}
