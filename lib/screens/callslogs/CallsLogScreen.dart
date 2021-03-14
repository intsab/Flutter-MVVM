import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:private_communication/data/DataModels/CallHistoryModel.dart';
import 'package:private_communication/screens/callslogs/CallLogsViewModel.dart';
import 'package:private_communication/screens/dialpad/DialPadScreen.dart';
import 'package:private_communication/widgets/CallsLogListItem.dart';

class CallsLogScreen extends StatefulWidget {
  @override
  _CallsLogScreenState createState() => _CallsLogScreenState();
}

class _CallsLogScreenState extends State<CallsLogScreen> with WidgetsBindingObserver{
  List<CallHistoryModel> list = [];

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (list.isNotEmpty) {
          return Stack(children: <Widget>[
            ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: list.length,
              itemBuilder: (context, index) {
                final CallHistoryModel? item = list[index];
                return CallListItem(item);
              },
            )
          ]);
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.call),
                  ),
                  Text(
                    'No Calls Yet! Call Your Friend By Pressing Dialer Button Below',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.dialpad),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => DialPadScreen()),
          );
        },
      ),
    );
  }

  void getHistory() async {
    EasyLoading.show(status: 'Please Wait...');
    list = await CallLogsViewModel().getCallLogs();
    EasyLoading.dismiss();
    setState(() {});
  }
}
