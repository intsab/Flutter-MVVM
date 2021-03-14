import 'package:floor/floor.dart';

@entity
class MessagesModel {
  @primaryKey
  final int id;
  final int conversationId;
  final String dateTime;
  final String message;

  MessagesModel(this.id, this.conversationId, this.dateTime, this.message);
}
