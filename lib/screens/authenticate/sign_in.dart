// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartfit/screens/authenticate/register.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/shared/components/account_check.dart';
import 'package:smartfit/shared/components/rounded_button.dart';
import 'package:smartfit/shared/components/rounded_input_field.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // instance of the auth service class
  final AuthService _auth = AuthService();

  bool loading = false;
  //store email and password
  String email = "";
  String password = "";
  String error = "";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[100],
            body: Form(
              key: _formkey,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: kPrimaryColor),
                      ),
                      SizedBox(height: size.height * 0.007),
                      Text(
                        "WELCOME BACK !",
                        style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                      ),
                      SizedBox(height: size.height * 0.004),
                      AccountCheck(
                          login: true,
                          press: () {
                            widget.toggleView();
                          }),
                      SizedBox(height: size.height * 0.10),
                      RoundedInputField(
                          hintText: "Enter your E-mail",
                          obscureText: false,
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter an email";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          }),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      RoundedInputField(
                          hintText: "Enter your Password",
                          icon: Icons.lock,
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Enter a password 6+ char long';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscureText: true),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      RoundedButton(
                        text: "Sign In",
                        press: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    "Coud not sign in with those credentials";
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
