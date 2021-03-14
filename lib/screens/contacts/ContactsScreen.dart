import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/screens/contacts/CreateContectsScreen.dart';
import 'package:private_communication/widgets/ContactListItem.dart';

import 'ContactsViewModel.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> with WidgetsBindingObserver{
  List<ContactsModel> list = [];

  @override
  void initState() {
    super.initState();
    getContacts();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getContacts();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        /// some operation here ...
        if (list.isNotEmpty) {
          return Stack(children: <Widget>[
            ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: list.length,
              itemBuilder: (context, index) {
                final ContactsModel? item = list[index];
                return ContactListItem(item);
              },
            )
          ]);
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.contact_phone),
                  ),
                  Text(
                    'No Contact Added, Add New Contact By Pressing Dialer Button Below',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
      }),
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

  void getContacts() async {
    EasyLoading.show(status: 'Please Wait...');
    list = await ContactsViewModel().getContacts();
    EasyLoading.dismiss();
    setState(() {});
  }
}
