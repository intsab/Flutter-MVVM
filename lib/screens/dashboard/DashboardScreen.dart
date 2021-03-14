import 'package:flutter/material.dart';
import 'package:private_communication/screens/callslogs/CallsLogScreen.dart';
import 'package:private_communication/screens/contacts/ContactsScreen.dart';
import 'package:private_communication/screens/messages/MessagesScreen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.contact_phone),
                  text: 'Contacts',
                ),
                Tab(
                  icon: Icon(Icons.phone_callback),
                  text: 'Call Logs',
                ),
                Tab(
                  icon: Icon(Icons.message),
                  text: 'Messages',
                ),
              ],
            ),
            title: Text('Private Planet'),
          ),
          body: TabBarView(
            children: [
              ContactsScreen(),
              CallsLogScreen(),
              MessagesScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
