import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartfit/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get auth {
    return _auth;
  }

  //auth change user stream (get li2am getter)
  Stream<User?> get user {
    return _auth.userChanges();
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      //create a new doc for the user with his uid
      // await DatabaseService(uid: user!.uid)
      //     .updateUserData('0', 'new crew member', 100);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
