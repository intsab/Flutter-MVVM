import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';

@dao
abstract class CallLogsDao {
  @Query('SELECT * FROM CallHistoryModel')
  Future<List<CallHistoryModel>> getAllMessages();

  @Query('DELETE * FROM CallHistoryModel WHERE id = :id')
  Future<void> deleteHistory(int id);

  @insert
  Future<void> insertCallLog(CallHistoryModel message);
}
