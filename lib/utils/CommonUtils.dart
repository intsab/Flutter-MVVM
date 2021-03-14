import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenName {
  static String ROOT_SCREEN = '/';
  static String REGISTRATION_SCREEN = '/registration';
  static String LOGIN_SCREEN = '/login';
  static String DASHBOARD_SCREEN = '/dashboard';

  static String CONTACTS_SCREEN = '/contacts';
  static String MESSAGES_SCREEN = '/messages';
  static String CALL_LOGS_SCREEN = '/callLogs';
  static String SEND_SMS_SCREEN = '/sms';
  static String CREATE_CONTACT_SCREEN = '/create_contact';
  static String KEYBOARD_SCREEN = '/keypad';
  static String SETTINGS_SCREEN = '/settings';
}

class Constants {
  static const String API_KEY = 'https://intsab.com';
}

class CommonUtils {
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
