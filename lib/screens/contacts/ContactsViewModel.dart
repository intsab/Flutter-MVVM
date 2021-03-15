import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/data/repositary/DatabaseRepositary.dart';

class ContactsViewModel {
  var _dataSource = DatabaseRepositary();

  void insertContact(ContactsModel contact) {
    _dataSource.insertContact(contact);
  }

  Future<List<ContactsModel>> getContacts() async {
    List<ContactsModel> contacts = await _dataSource.getAllContact();
    return contacts;
  }
}
