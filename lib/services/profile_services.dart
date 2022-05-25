import 'dart:io';

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
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future uploadfile(String destination, File file) async {
    final ref = FirebaseStorage.instance.ref(destination);
    await ref.putFile(file);
  }

  Future updateProfile(String uid) async {
    String url = await FirebaseStorage.instance
        .ref()
        .child("/Images/$uid")
        .getDownloadURL();
    await _auth.currentUser!.updatePhotoURL(url);
  }
}
