import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:private_communication/data/DataModels/UserModel.dart';
import 'package:private_communication/utils/CommonUtils.dart';

import 'RegisterViewModel.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Registration",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: emailController,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email Address',
                  labelText: 'Enter Email Address'),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 10),
              child: TextField(
                controller: passwordController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                    labelText: 'Enter Password'),
                obscureText: true,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: TextField(
                controller: confirmPasswordController,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Confirm Password',
                    labelText: 'Enter Confirm Password'),
                obscureText: true,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;
                  if (email.isEmpty) {
                    CommonUtils().showToast('Please Enter Email Address');
                  } else if (password.isEmpty) {
                    CommonUtils().showToast('Please Enter Password');
                  } else if (confirmPassword != password) {
                    CommonUtils().showToast('Password Do Not Match');
                  } else if (confirmPassword.length < 6) {
                    CommonUtils()
                        .showToast('Password Must Be At-least 6 Character');
                  } else {
                    register(password, email);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register(String password, String email) async {
    EasyLoading.show(status: 'Please Wait Registering...');

    UserModel? user = await RegisterViewModel().registerUser(email, password);
    EasyLoading.dismiss();
    if (user != null && user.email.isNotEmpty) {
      Navigator.pushNamedAndRemoveUntil(
          context, ScreenName.DASHBOARD_SCREEN, (r) => false);
    } else {
      CommonUtils().showToast('Already Exist / Error Registering New User');
    }
  }
}
