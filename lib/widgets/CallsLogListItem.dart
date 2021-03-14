import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';

class CallListItem extends StatelessWidget {
  final CallHistoryModel? item;

  const CallListItem(this.item);

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
                Icons.call_made,
                size: 33,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  item!.dateTime,
                  style:
                      const TextStyle(fontSize: 18, color: Colors.blueAccent),
                ),
              ),
              const Spacer(),
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
