import 'package:firebase_auth/firebase_auth.dart';

class ProfileServices {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuth authenticate;
  ProfileServices({required this.authenticate});
  void updateImage() {}

  void updateProfileName(String name) async {
    await authenticate.currentUser!.reload();
    await authenticate.currentUser!.updateDisplayName(name);
    await authenticate.currentUser!.reload();
  }
}
