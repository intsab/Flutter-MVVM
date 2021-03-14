import 'package:floor/floor.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';

@dao
abstract class ContactsDao {
  @Query('SELECT * FROM Contacts')
  Future<List<ContactsModel>> getAllMessages();

  @Query('SELECT * FROM Contacts WHERE name = :name')
  Future<List<ContactsModel?>> searchContacts(String name);

  @Query('DELETE * FROM Contacts WHERE id = :id')
  Future<void> deleteContact(String id);

  @insert
  Future<void> insertContact(ContactsModel contact);
}
