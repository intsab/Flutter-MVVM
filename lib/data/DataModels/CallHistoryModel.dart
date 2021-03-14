import 'package:floor/floor.dart';

@entity
class CallHistoryModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int contacts_id;
  final String dateTime;

  CallHistoryModel(this.id, this.contacts_id, this.dateTime);
}
