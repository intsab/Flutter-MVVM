import 'package:flutter/material.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/screens/contacts/ContactsViewModel.dart';
import 'package:private_communication/screens/contacts/CreateContectsScreen.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<ContactsModel> list = [];

  @override
  void initState() {
    super.initState();
    (ContactsViewModel().getContacts())
        .then((List<ContactsModel> value) => {list = value});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: list.length,
          itemBuilder: (context, index) {
            final ContactsModel? item = list[index];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 33,
                      ),
                      Text(item!.name)
                    ],
                  ),
                ),
              ],
            );
          },
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.playlist_add_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (context) => CreateContactsScreen()),
          );
        },
      ),
    );
  }
}
