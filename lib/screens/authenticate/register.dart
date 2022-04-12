// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/shared/components/account_check.dart';
import 'package:smartfit/shared/components/rounded_button.dart';
import 'package:smartfit/shared/components/rounded_input_field.dart';
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
            backgroundColor: Colors.grey[100],
            body: Form(
                key: _formKey,
                child: Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: kPrimaryColor),
                        ),
                        SizedBox(height: size.height * 0.007),
                        Text(
                          "REGISTER YOURSELF HERE",
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[500]),
                        ),
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
                        SizedBox(
                          height: size.height * 0.05,
                        ),
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
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        RoundedButton(
                          text: "Sign Up",
                          press: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = "Please supply a avalid email";
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(height: size.height * 0.004),
                        AccountCheck(
                            login: false,
                            press: () {
                              widget.toggleView();
                            }),
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
                )),
          );
  }
}
