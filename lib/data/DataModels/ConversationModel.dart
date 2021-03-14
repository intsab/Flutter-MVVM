import 'package:floor/floor.dart';

@entity
class ConversationModel {
  @primaryKey
  final int id;
  final int contactsId;
  final String lastMessage;

  ConversationModel(this.id, this.contactsId, this.lastMessage);
}
