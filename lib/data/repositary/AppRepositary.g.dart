// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppRepositary.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppRepositary {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppRepositaryBuilder databaseBuilder(String name) =>
      _$AppRepositaryBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppRepositaryBuilder inMemoryDatabaseBuilder() =>
      _$AppRepositaryBuilder(null);
}

class _$AppRepositaryBuilder {
  _$AppRepositaryBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppRepositaryBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppRepositaryBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppRepositary> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppRepositary();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppRepositary extends AppRepositary {
  _$AppRepositary([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContactsDao? _contactsDaoInstance;

  CallLogsDao? _callLogsDaoInstance;

  MessagesDao? _messagesDaoInstance;

  ConversationDao? _conversationDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ContactsModel` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `email` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ConversationModel` (`id` INTEGER NOT NULL, `contactsId` INTEGER NOT NULL, `lastMessage` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MessagesModel` (`id` INTEGER NOT NULL, `conversationId` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, `message` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CallHistoryModel` (`id` INTEGER NOT NULL, `contacts_id` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ContactsDao get contactsDao {
    return _contactsDaoInstance ??= _$ContactsDao(database, changeListener);
  }

  @override
  CallLogsDao get callLogsDao {
    return _callLogsDaoInstance ??= _$CallLogsDao(database, changeListener);
  }

  @override
  MessagesDao get messagesDao {
    return _messagesDaoInstance ??= _$MessagesDao(database, changeListener);
  }

  @override
  ConversationDao get conversationDao {
    return _conversationDaoInstance ??=
        _$ConversationDao(database, changeListener);
  }
}

class _$ContactsDao extends ContactsDao {
  _$ContactsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contactsModelInsertionAdapter = InsertionAdapter(
            database,
            'ContactsModel',
            (ContactsModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ContactsModel> _contactsModelInsertionAdapter;

  @override
  Future<List<ContactsModel>> getAllMessages() async {
    return _queryAdapter.queryList('SELECT * FROM Contacts',
        mapper: (Map<String, Object?> row) => ContactsModel(
            row['id'] as int,
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String));
  }

  @override
  Future<List<ContactsModel?>> searchContacts(String name) async {
    return _queryAdapter.queryList('SELECT * FROM Contacts WHERE name = ?',
        arguments: [name],
        mapper: (Map<String, Object?> row) => ContactsModel(
            row['id'] as int,
            row['name'] as String,
            row['phoneNumber'] as String,
            row['email'] as String));
  }

  @override
  Future<void> deleteContact(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM Contacts WHERE id = ?', arguments: [id]);
  }

  @override
  Future<void> insertContact(ContactsModel contact) async {
    await _contactsModelInsertionAdapter.insert(
        contact, OnConflictStrategy.abort);
  }
}

class _$CallLogsDao extends CallLogsDao {
  _$CallLogsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _callHistoryModelInsertionAdapter = InsertionAdapter(
            database,
            'CallHistoryModel',
            (CallHistoryModel item) => <String, Object?>{
                  'id': item.id,
                  'contacts_id': item.contacts_id,
                  'dateTime': item.dateTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CallHistoryModel> _callHistoryModelInsertionAdapter;

  @override
  Future<List<CallHistoryModel>> getAllMessages() async {
    return _queryAdapter.queryList('SELECT * FROM CallLogs',
        mapper: (Map<String, Object?> row) => CallHistoryModel(row['id'] as int,
            row['contacts_id'] as int, row['dateTime'] as String));
  }

  @override
  Future<void> deleteHistory(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM CallLogs WHERE id = ?', arguments: [id]);
  }

  @override
  Future<void> insertCallLog(CallHistoryModel message) async {
    await _callHistoryModelInsertionAdapter.insert(
        message, OnConflictStrategy.abort);
  }
}

class _$MessagesDao extends MessagesDao {
  _$MessagesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _messagesModelInsertionAdapter = InsertionAdapter(
            database,
            'MessagesModel',
            (MessagesModel item) => <String, Object?>{
                  'id': item.id,
                  'conversationId': item.conversationId,
                  'dateTime': item.dateTime,
                  'message': item.message
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MessagesModel> _messagesModelInsertionAdapter;

  @override
  Future<List<MessagesModel>> getMessagesByConversationId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Messages WHERE conversationId = ?',
        arguments: [id],
        mapper: (Map<String, Object?> row) => MessagesModel(
            row['id'] as int,
            row['conversationId'] as int,
            row['dateTime'] as String,
            row['message'] as String));
  }

  @override
  Future<void> insertMessage(MessagesModel message) async {
    await _messagesModelInsertionAdapter.insert(
        message, OnConflictStrategy.abort);
  }
}

class _$ConversationDao extends ConversationDao {
  _$ConversationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _conversationModelInsertionAdapter = InsertionAdapter(
            database,
            'ConversationModel',
            (ConversationModel item) => <String, Object?>{
                  'id': item.id,
                  'contactsId': item.contactsId,
                  'lastMessage': item.lastMessage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ConversationModel> _conversationModelInsertionAdapter;

  @override
  Future<List<ConversationModel>> getAllConversations() async {
    return _queryAdapter.queryList('SELECT * FROM Conversation',
        mapper: (Map<String, Object?> row) => ConversationModel(
            row['id'] as int,
            row['contactsId'] as int,
            row['lastMessage'] as String));
  }

  @override
  Future<ConversationModel?> deleteConversationById(int conversationId) async {
    return _queryAdapter.query('DELETE * FROM Conversation WHERE id = ?',
        arguments: [conversationId],
        mapper: (Map<String, Object?> row) => ConversationModel(
            row['id'] as int,
            row['contactsId'] as int,
            row['lastMessage'] as String));
  }

  @override
  Future<void> insertConversation(ConversationModel conversation) async {
    await _conversationModelInsertionAdapter.insert(
        conversation, OnConflictStrategy.abort);
  }
}
