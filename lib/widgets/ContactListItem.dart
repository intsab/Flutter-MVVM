import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/data/DataModels/ContactModel.dart';
import 'package:private_communication/screens/callslogs/CallLogsViewModel.dart';

class ContactListItem extends StatelessWidget {
  final ContactsModel? item;

  const ContactListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                size: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  item!.name,
                  style:
                      const TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.call),
                ),
                onTap: () {
                  CallLogsViewModel().insertCallLog(CallHistoryModel(null,-1,item!.phoneNumber));
                  _callNumber(item!.phoneNumber);
                },
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }

  void _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
