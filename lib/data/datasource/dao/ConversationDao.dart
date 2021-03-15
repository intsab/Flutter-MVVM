import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/ConversationModel.dart';

@dao
abstract class ConversationDao {
  @Query('SELECT * FROM ConversationModel')
  Future<List<ConversationModel>> getAllConversations();

  @Query('DELETE * FROM ConversationModel WHERE id = :conversationId')
  Future<ConversationModel?> deleteConversationById(int conversationId);

  @insert
  Future<void> insertConversation(ConversationModel conversation);
}
