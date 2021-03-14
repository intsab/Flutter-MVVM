import 'package:private_communication/data/repositary/FirebaseRepositary.dart';

class SplashViewModel {
  FirebaseRepositary _repo = FirebaseRepositary();

  bool isUserLogin() {
    return _repo.isUserLogin();
  }
}
