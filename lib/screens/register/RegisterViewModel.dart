import 'package:firebase_auth/firebase_auth.dart';
import 'package:private_communication/data/DataModels/UserModel.dart';
import 'package:private_communication/data/repositary/FirebaseRepositary.dart';

class RegisterViewModel {
  FirebaseRepositary _repo = FirebaseRepositary();

  Future<UserModel?> registerUser(String email, String password) async {
    try {
      UserCredential? userCredential =
          await _repo.registerUser(email, password);
      if (userCredential != null) {
        UserModel(userCredential.user.email,
            userCredential.additionalUserInfo.isNewUser);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
