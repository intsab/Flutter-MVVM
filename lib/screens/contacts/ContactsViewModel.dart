import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/data/datasource/AppDataSource.dart';

class ContactsViewModel {
  var _dataSource = AppDataSource();

  void insertContact(ContactsModel contact) {
    _dataSource.insertContact(contact);
  }

  Future<List<ContactsModel>> getContacts() async {
    Future<List<ContactsModel>> contacts = _dataSource.getAllContact();
    return contacts;
  }
}
