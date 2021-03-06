// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/edit_button.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/shared/background.dart';
import './components/rounded_button.dart';
import 'components/profile_image.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (user!.isAnonymous) SizedBox() else EditButton(),
                    Logo(),
                  ],
                ),
              ),
              Profile(imageUrl: user.photoURL),
              if (user.displayName == null)
                SizedBox(height: 8)
              else
                Text(
                  user.displayName.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              // RoundedButton(
              //   function: () {},
              //   text: "Admin Dashboard",
              //   iconData: Icons.arrow_forward_ios,
              // ),
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
        ),
      ),
    );
  }
}
