import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:private_communication/data/DataModels/UserModel.dart';
import 'package:private_communication/screens/login/LoginViewModel.dart';
import 'package:private_communication/utils/CommonUtils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel vc = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

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
                "Welcome To Private Planet",
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
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
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
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                  if (email.isEmpty) {
                    CommonUtils().showToast('Please Enter Email Address');
                  } else if (password.isEmpty) {
                    CommonUtils().showToast('Please Enter Email Password');
                  } else {
                    login(email, password);
                  }
                },
              ),
            ),
            OutlineButton(
              color: Colors.lightBlue,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.REGISTRATION_SCREEN);
              },
            )
          ],
        ),
      ),
    );
  }

  void login(String email, String password) async {
    EasyLoading.show(status: 'Please Wait...');
    UserModel? user = await vc.loginUser(email, password);
    EasyLoading.dismiss();
    if (user != null && user.email.isNotEmpty) {
      Navigator.pushNamedAndRemoveUntil(context, ScreenName.DASHBOARD_SCREEN, (r) => false);
    }else{
      CommonUtils().showToast('User Name or Password is In-Correct');
    }
  }
}
