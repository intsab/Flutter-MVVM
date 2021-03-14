import 'package:firebase_auth/firebase_auth.dart';
import 'package:private_communication/data/DataModels/UserModel.dart';
import 'package:private_communication/data/repositary/FirebaseRepositary.dart';

class LoginViewModel {
  FirebaseRepositary _repo = FirebaseRepositary();

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      UserCredential? userCredential = await _repo.loginUser(email, password);
      if (userCredential != null) {
        return UserModel(userCredential.user.email,
            userCredential.additionalUserInfo.isNewUser);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
