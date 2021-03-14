import 'package:flutter/material.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/screens/contacts/ContactsViewModel.dart';
import 'package:private_communication/utils/CommonUtils.dart';

class CreateContactsScreen extends StatefulWidget {
  @override
  _CreateContactsScreenState createState() => _CreateContactsScreenState();
}

class _CreateContactsScreenState extends State<CreateContactsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Create Contact'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Create New Contact',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: nameController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Person Name',
                      hintText: 'Person Name'),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
                  child: TextField(
                    controller: numberController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Phone Number',
                        hintText: 'Phone Number'),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: TextField(
                    controller: emailController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Email Address (Optional)',
                        hintText: 'Email Address'),
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      String name = nameController.text;
                      String number = numberController.text;
                      String email = emailController.text;
                      if (name.isEmpty) {
                        CommonUtils().showToast('Please Enter Person Name');
                      } else if (number.isEmpty) {
                        CommonUtils().showToast('Please Enter Number');
                      } else {
                        saveContact(name: name, number: number, email: email);
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void saveContact(
      {required String name, required String number, String email = ''}) async {
    ContactsViewModel().insertContact(ContactsModel(-1, name, number, email));
    Navigator.pop(context);
  }
}
