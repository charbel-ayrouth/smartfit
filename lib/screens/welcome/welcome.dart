// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:smartfit/screens/authenticate/components/rounded_button.dart';
import 'package:smartfit/screens/authenticate/sign_in.dart';
import 'package:smartfit/screens/home.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
            onPressed: Navigator.of(context).pop, child: Text("go back"))
      ]),
      body: Background(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 35),
            child: Row(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 5.0,
                ),
                Logo()
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Text(
              "WELCOME",
              // ignore: prefer_const_constructors
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          // ignore: sized_box_for_whitespace
          const SizedBox(height: 30),
          Container(
            color: Colors.black,
            child: Image.asset("assets/images/illustration1.jpeg"),
          ),
          // ignore: prefer_const_constructors, duplicate_ignore

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),

                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(text: "Your "),
                      TextSpan(
                          text: "Fitness, Wellness & Lifestyle",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " activities in a single platform."),
                    ])),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),

                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 104, 104, 104))),
                      TextSpan(
                          text: "Register here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ])),
          )
        ]),
      ),
    );
  }
}
