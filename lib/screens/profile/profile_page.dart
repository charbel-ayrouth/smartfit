// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/edit_button.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/shared/constants.dart';
import './components/rounded_button.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                EditButton(),
                Text("SmartFit"),
              ],
            ),
          ),
          CircleAvatar(
            radius: 52.0,
            backgroundColor: kSecondaryOrange,
            child: CircleAvatar(
              radius: 46.0,
              backgroundColor: Colors.blueAccent,
            ),
          ),
          Text(
            user!.email.toString(),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          RoundedButton(
            function: () {},
            text: "Admin Dashboard",
            iconData: Icons.arrow_forward_ios,
          ),
          RoundedButton(
            function: () {},
            text: "Reminder",
            iconData: Icons.arrow_forward_ios,
          ),
          RoundedButton(
            function: () {},
            text: "Rate us on the Play Store",
          ),
          RoundedButton(
            function: () {},
            text: "Terms & Conditions",
          ),
          RoundedButton(
              text: "Sign out",
              function: () async {
                await _auth.signOut();
              })
        ],
      ),
    );
  }
}
