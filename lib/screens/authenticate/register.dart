import 'package:flutter/material.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/screens/authenticate/components/account_check.dart';
import 'package:smartfit/screens/authenticate/components/rounded_button.dart';
import 'package:smartfit/screens/authenticate/components/rounded_input_field.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

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
  String username = "";
  String email = "";
  String password = "";
  String error = "";
  bool _new = true;
  bool _confirm = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Background(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 80),
                      const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 42,
                            color: kPrimaryColor),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "REGISTER YOURSELF HERE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFBABABA),
                        ),
                      ),
                      const SizedBox(height: 30),
                      RoundedInputField(
                          hintText: "Enter your username",
                          obscureText: false,
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter a valid username";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              username = value;
                            });
                          }),
                      const SizedBox(height: 23),
                      RoundedInputField(
                          hintText: "Enter your E-mail",
                          obscureText: false,
                          icon: Icons.alternate_email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter a valid email address";
                            }
                            // using regular expression
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          }),
                      const SizedBox(height: 23),
                      RoundedInputField(
                        controller: _pass,
                        hintText: "Enter your Password",
                        icon: Icons.lock,
                        suffixIcon1: IconButton(
                          color: kSecondaryOrange,
                          icon: Icon(
                              _new ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _new = !_new;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Enter a password 6+ char long';
                          }
                          // using regular expression
                          // if (!RegExp(
                          //         r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                          //     .hasMatch(value)) {
                          //   return "Password should be alpha numeric, contain a special character, greate than 8 characters";
                          // }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: _new,
                      ),
                      const SizedBox(height: 23),
                      RoundedInputField(
                        controller: _confirmPass,
                        hintText: "Confirm Password",
                        icon: Icons.lock,
                        suffixIcon1: IconButton(
                          color: kSecondaryOrange,
                          icon: Icon(_confirm
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _confirm = !_confirm;
                            });
                          },
                        ),
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
                        obscureText: _confirm,
                      ),
                      Text(
                        error,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      RoundedButton(
                        text: "Sign Up",
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email, password, username);
                            if (result == null ||
                                result.toString().contains('Problem Occured')) {
                              setState(() {
                                error = result.toString().substring(0, 17);
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      AccountCheck(
                          login: false,
                          press: () {
                            widget.toggleView('Login');
                          }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
