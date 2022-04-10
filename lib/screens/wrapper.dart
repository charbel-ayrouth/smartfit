// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smartfit/models/myuser.dart';
import 'package:smartfit/screens/authenticate/authenticate.dart';
import 'package:smartfit/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //accessing the user data from the provider
    final user = Provider.of<myUser?>(context);
    // redirect depending if signed in or not
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
