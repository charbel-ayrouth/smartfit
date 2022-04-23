import 'package:flutter/material.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';

class EmailVericationScreen extends StatelessWidget {
  const EmailVericationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kGrey,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
              onPressed: () {
                AuthService().signOut();
              },
            )),
        body: Background(
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Please verify your email',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ));
  }
}
