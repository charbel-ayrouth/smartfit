import 'package:flutter/material.dart';
import 'package:smartfit/screens/authenticate/register.dart';
import 'package:smartfit/screens/authenticate/sign_in.dart';
import 'package:smartfit/screens/welcome/welcome.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String showSignIn = '';
  void toggleView(String screen) {
    setState(() {
      showSignIn = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn == 'Login') {
      return SignIn(toggleView: toggleView);
    } else if (showSignIn == 'Register') {
      return Register(toggleView: toggleView);
    } else {
      return Welcome(
        toggleView: toggleView,
      );
    }
  }
}
