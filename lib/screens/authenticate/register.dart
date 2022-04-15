// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/screens/authenticate/components/account_check.dart';
import 'package:smartfit/screens/authenticate/components/rounded_button.dart';
import 'package:smartfit/screens/authenticate/components/rounded_input_field.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  //we are going to use this key to identify our form
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool loading = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              // width: double.infinity,
              // height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 42,
                            color: kPrimaryColor),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "REGISTER YOURSELF HERE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFBABABA),
                        ),
                      ),
                      SizedBox(height: 47),
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
                      SizedBox(height: 30),
                      RoundedInputField(
                        controller: _pass,
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
                        obscureText: true,
                      ),
                      SizedBox(height: 30),
                      RoundedInputField(
                        controller: _confirmPass,
                        hintText: "Confirm Password",
                        icon: Icons.lock,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Enter a password 6+ char long';
                          }
                          if (value != _pass.text) {
                            return "Not Match";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 10),
                      RoundedButton(
                        text: "Sign Up",
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = "Please supply a avalid email";
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      AccountCheck(
                          login: false,
                          press: () {
                            widget.toggleView();
                          }),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
