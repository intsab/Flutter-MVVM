import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/data/DataModels/ConversationModel.dart';
import 'package:private_communication/data/DataModels/MessagesModel.dart';
import 'package:private_communication/data/repositary/dao/CallLogsDao.dart';
import 'package:private_communication/data/repositary/dao/ContactsDao.dart';
import 'package:private_communication/data/repositary/dao/ConversationDao.dart';
import 'package:private_communication/data/repositary/dao/MessagesDao.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
part 'AppRepositary.g.dart';

@Database(version: 1, entities: [
  ContactsModel,
  ConversationModel,
  MessagesModel,
  CallHistoryModel
])
abstract class AppRepositary extends FloorDatabase {
  ContactsDao get contactsDao;

  CallLogsDao get callLogsDao;

  MessagesDao get messagesDao;

  ConversationDao get conversationDao;
}
