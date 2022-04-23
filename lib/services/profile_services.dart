import 'package:firebase_auth/firebase_auth.dart';

class ProfileServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future updateImage(String path) async {
    await _auth.currentUser!.updatePhotoURL(path);
  }

  Future updateProfileName(String name) async {
    await _auth.currentUser!.updateDisplayName(name);
  }

  Future updatePassword(String password) async {
    await _auth.currentUser!.updatePassword(password);
  }

  Future<bool> validateCurrentPassword(String password) async {
    User? firebaseUser = _auth.currentUser;
    AuthCredential authCredentials = EmailAuthProvider.credential(
      email: firebaseUser!.email.toString(),
      password: password,
    );
    try {
      var authResult =
          await firebaseUser.reauthenticateWithCredential(authCredentials);
      if (authResult.user != null) {
        print("true");
        print(authResult.user);
        return true;
      } else {
        print(authResult.user);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
