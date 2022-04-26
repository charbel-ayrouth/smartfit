// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smartfit/screens/authenticate/components/sign_in_with.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/screens/authenticate/components/account_check.dart';
import 'package:smartfit/screens/authenticate/components/rounded_button.dart';
import 'package:smartfit/screens/authenticate/components/rounded_input_field.dart';
import 'package:smartfit/shared/background.dart';
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
  bool _isObcscure = true;
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
            body: Background(
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "WELCOME BACK !",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(
                              0xFFBABABA,
                            ),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 50),
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
                      SizedBox(height: 40),
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
                        obscureText: _isObcscure,
                        suffixIcon1: IconButton(
                          color: kSecondaryOrange,
                          icon: Icon(_isObcscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObcscure = !_isObcscure;
                            });
                          },
                        ),
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 33),
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
                        height: 25,
                      ),
                      SignInWith(
                        icon1: Icons.facebook,
                        onTap: () {},
                      ),
                      SignInWith(
                        icon1: Icons.email_rounded,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AccountCheck(
                          login: true,
                          press: () {
                            widget.toggleView();
                          }),
                      // SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
