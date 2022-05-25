import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartfit/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream (get li2am getter)
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //stream for change in user properties (display name , email ...)
  Stream<User?> get userData {
    return _auth.userChanges();
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
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
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      //create a new doc for the user
      await DatabaseService(uid: user!.uid).updateWorkoutData([], [], 0);
      user.updateDisplayName(username);
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      return user;
    } on FirebaseAuthException catch (e) {
      return 'Problem Occured: ' + e.toString();
    } catch (error) {
      return 'Problem Occured: Something Went Wrong';
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
