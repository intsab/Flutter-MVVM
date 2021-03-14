import 'package:flutter/material.dart';

class SendSmsScreen extends StatefulWidget {
  @override
  _SendSmsScreenState createState() => _SendSmsScreenState();
}

class _SendSmsScreenState extends State<SendSmsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Sms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Send Sms'),
      ),
    );
  }
}
