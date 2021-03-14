import 'package:flutter/material.dart';
import 'package:private_communication/screens/contacts/ContactsViewModel.dart';
import 'package:private_communication/screens/contacts/CreateContectsScreen.dart';
import 'package:private_communication/utils/CommonUtils.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();
    var contacts= ContactsViewModel().getContacts();
    print('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(child: Icon(Icons.contact_phone)),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add_outlined),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new CreateContactsScreen())
          );
        },
      ),
    );
  }
}
