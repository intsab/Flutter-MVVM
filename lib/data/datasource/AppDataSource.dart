import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/data/DataModels/ConversationModel.dart';
import 'package:private_communication/data/DataModels/MessagesModel.dart';
import 'package:private_communication/data/repositary/AppRepositary.dart';

class AppDataSource {
  final String dbName = 'private_planet.db';

  void insertContact(ContactsModel contact) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.contactsDao.insertContact(contact);
  }

  void deleteContact(String contactId) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.contactsDao.deleteContact(contactId);
  }

  Future<List<ContactsModel>> getAllContact() async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    return database.contactsDao.getAllContacts();
  }

  //Conversations Methods
  void insertConversation(ConversationModel conversation) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.conversationDao.insertConversation(conversation);
  }

  void deleteConversation(int conversationId) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.conversationDao.deleteConversationById(conversationId);
  }

  Future<List<ConversationModel>> getAllConversation() async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    return database.conversationDao.getAllConversations();
  }

  //Messages Methods
  void insertMessage(MessagesModel message) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.messagesDao.insertMessage(message);
  }

  Future<List<MessagesModel>> getMessages(int conversationId) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    return database.messagesDao.getMessagesByConversationId(conversationId);
  }

  //CallLogs Methods
  void insertCallLog(CallHistoryModel call) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.callLogsDao.insertCallLog(call);
  }

  void deleteCallLog(int callId) async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    database.callLogsDao.deleteHistory(callId);
  }

  Future<List<CallHistoryModel>> getCallLog() async {
    final database = await $FloorAppRepositary.databaseBuilder(dbName).build();
    return database.callLogsDao.getAllMessages();
  }
}
