import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future updateProfile(String url) async {
    await _auth.currentUser!
        .updatePhotoURL("gs://smartfit-35c48.appspot.com/Images/+$url");
  }

  Future<String> getProfileUrl(String photoUrl) async {
    String url = await FirebaseStorage.instance
        .ref()
        .child(
            "gs://smartfit-35c48.appspot.com/Images/xQ8KcDx93YV0u4idjjfcLYXrgKf1.jpg")
        .getDownloadURL();
    print(url);
    return url;
  }
}
