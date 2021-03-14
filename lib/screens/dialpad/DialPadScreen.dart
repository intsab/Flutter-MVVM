import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/screens/callslogs/CallLogsViewModel.dart';

class DialPadScreen extends StatefulWidget {
  @override
  _DialPadScreen createState() => _DialPadScreen();
}

class _DialPadScreen extends State<DialPadScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: DialPad(
              dialButtonColor: Colors.blue,
              buttonTextColor: Colors.blueAccent,
              enableDtmf: true,
              backspaceButtonIconColor: Colors.red,
              makeCall: (number) {
                _callNumber(number);
              })),
    );
  }

  void _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    CallLogsViewModel().insertCallLog(CallHistoryModel(null, -1, number));
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
