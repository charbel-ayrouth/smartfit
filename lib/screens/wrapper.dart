// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartfit/screens/authenticate/authenticate.dart';
import 'package:smartfit/screens/emailVerificationScreen/emailVerificationScreen.dart';
import 'package:smartfit/screens/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //accessing the user data from the provider
    final user = Provider.of<User?>(context);
    // redirect depending if signed in or not
    if (user == null) {
      return Authenticate();
    } else if (user.emailVerified) {
      return Home();
    } else {
      return EmailVericationScreen();
    }
  }
}
