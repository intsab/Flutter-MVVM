import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';

@dao
abstract class ContactsDao {
  @Query('SELECT * FROM ContactsModel')
  Future<List<ContactsModel>> getAllMessages();

  @Query('SELECT * FROM ContactsModel WHERE name = :name')
  Future<List<ContactsModel?>> searchContacts(String name);

  @Query('DELETE * FROM ContactsModel WHERE id = :id')
  Future<void> deleteContact(String id);

  @insert
  Future<void> insertContact(ContactsModel contact);
}
