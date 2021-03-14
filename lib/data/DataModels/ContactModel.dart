import 'package:floor/floor.dart';

@entity
class ContactsModel {
  @primaryKey
  final int id;
  final String name;
  final String phoneNumber;
  final String email;

  ContactsModel(this.id, this.name, this.phoneNumber, this.email);
}
