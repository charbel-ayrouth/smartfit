// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;
  AccountCheck({required this.login, required this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(
            color: Color(0xFF777777),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
