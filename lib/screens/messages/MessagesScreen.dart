import 'package:flutter/material.dart';
import 'package:private_communication/screens/messages/SendSmsScreen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(child: Icon(Icons.message)),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.messenger_outline),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new SendSmsScreen()));
        },
      ),
    );
  }
}
