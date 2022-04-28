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
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

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
    return loading
        ? Loading()
        : Scaffold(
            body: Background(
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 100),
                      const Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "WELCOME BACK !",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(
                              0xFFBABABA,
                            ),
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 40),
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
                      const SizedBox(height: 40),
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
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                      AccountCheck(
                          login: true,
                          press: () {
                            widget.toggleView('Register');
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      SignInWith(
                        title: 'Sign In With Facebook',
                        icon1: Icons.facebook,
                        onTap: () {},
                      ),
                      SignInWith(
                        title: 'Sign In with Googe',
                        icon1: Icons.email_rounded,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
