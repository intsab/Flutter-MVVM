import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/data/DataModels/ConversationModel.dart';
import 'package:private_communication/data/DataModels/MessagesModel.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

import 'dao/CallLogsDao.dart';
import 'dao/ContactsDao.dart';
import 'dao/ConversationDao.dart';
import 'dao/MessagesDao.dart';
part 'DbDataSource.g.dart';

@Database(version: 1, entities: [
  ContactsModel,
  ConversationModel,
  MessagesModel,
  CallHistoryModel
])
abstract class DbDataSource extends FloorDatabase {
  ContactsDao get contactsDao;

  CallLogsDao get callLogsDao;

  MessagesDao get messagesDao;

  ConversationDao get conversationDao;
}
