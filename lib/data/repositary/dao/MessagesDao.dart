import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/MessagesModel.dart';

@dao
abstract class MessagesDao {
  @Query('SELECT * FROM Messages WHERE conversationId = :id')
  Future<List<MessagesModel>> getMessagesByConversationId(int id);

  @insert
  Future<void> insertMessage(MessagesModel message);
}
