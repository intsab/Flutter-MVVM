import 'package:flutter/material.dart';

import 'SendSmsScreen.dart';

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
        Center(child: const Icon(Icons.message)),
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.messenger_outline),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => SendSmsScreen()),
          );
        },
      ),
    );
  }
}
