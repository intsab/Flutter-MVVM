import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:private_communication/screens/SettingsScreen.dart';
import 'package:private_communication/screens/dashboard/DashboardScreen.dart';
import 'package:private_communication/screens/login/LoginScreen.dart';
import 'package:private_communication/screens/messages/SendSmsScreen.dart';
import 'package:private_communication/screens/register/RegistrationScreen.dart';
import 'package:private_communication/screens/splash/SplashScreen.dart';
import 'screens/contacts/CreateContectsScreen.dart';
import 'utils/CommonUtils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Private Connections',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          ScreenName.ROOT_SCREEN: (context) => SplashScreen(),
          ScreenName.LOGIN_SCREEN: (context) => LoginScreen(),
          ScreenName.REGISTRATION_SCREEN: (context) => RegistrationScreen(),
          ScreenName.DASHBOARD_SCREEN: (context) => DashboardScreen(),
          ScreenName.SEND_SMS_SCREEN: (context) => SendSmsScreen(),
          ScreenName.CREATE_CONTACT_SCREEN: (context) => CreateContactsScreen(),
          ScreenName.SETTINGS_SCREEN: (context) => SettingsScreen(),
        },
        builder: EasyLoading.init());
  }

  void configLoading() {
    EasyLoading.init();
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
