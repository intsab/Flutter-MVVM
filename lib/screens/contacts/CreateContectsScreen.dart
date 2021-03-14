import 'package:flutter/material.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/screens/contacts/ContactsViewModel.dart';
import 'package:private_communication/utils/CommonUtils.dart';

class CreateContactsScreen extends StatefulWidget {
  @override
  _CreateContactsScreenState createState() => _CreateContactsScreenState();
}

class _CreateContactsScreenState extends State<CreateContactsScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Create New Contact",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: nameController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Person Name',
                    hintText: 'Person Name'),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 10),
                child: TextField(
                  controller: numberController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Phone Number',
                      hintText: 'Phone Number'),
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: TextField(
                  controller: emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email Address (Optional)',
                      hintText: 'Email Address'),
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Save",
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
                      saveContact(name, number, email);
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void saveContact(String name, String number, String email) async {
    ContactsViewModel().insertContact(ContactsModel(-1, name, number, email));
  }
}
