import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:private_communication/utils/CommonUtils.dart';

import 'SplashViewModel.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
   // late AnimationController animationController;
   // late Animation animation;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    // animationController =
    //     AnimationController(duration: Duration(seconds: 5), vsync: this);
    // animation = ColorTween(begin: Colors.blue, end: Colors.white)
    //     .animate(animationController);
    // animationController.forward();
    // animationController.addListener(() {
    //   setState(() {});
    // });

    Future.delayed(
      const Duration(seconds: 4),
      () => {
        if (SplashViewModel().isUserLogin())
          {
            Navigator.pushNamedAndRemoveUntil(
                context, ScreenName.DASHBOARD_SCREEN, (r) => false)
          }
        else
          {
            Navigator.pushNamedAndRemoveUntil(
                context, ScreenName.LOGIN_SCREEN, (r) => false)
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
            child: const Text(
              'Your Private Planet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                color: Colors.amber,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

}
