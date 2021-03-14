import 'package:flutter/material.dart';

class CallsLogScreen extends StatefulWidget {
  @override
  _CallsLogScreenState createState() => _CallsLogScreenState();
}

class _CallsLogScreenState extends State<CallsLogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(child: Icon(Icons.call)),
      ]),
    );
  }
}
