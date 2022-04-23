// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/profile_image.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

import '../profile/components/edit_photo.dart';
import '../profile/components/go_back_button.dart';
import '../profile/components/logo.dart';
import 'components/change_password_button.dart';
import 'components/password_form.dart';
import 'components/save_button.dart';
import 'components/text_field_input.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String error = "";
  String? Name;
  String? Email;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    void _showPasswordForm() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: PasswordForm(),
            );
          });
    }

    return loading
        ? Loading()
        : Scaffold(
            body: Background(
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 37.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GoBackButton(),
                                  Logo(),
                                ],
                              ),
                              Profile(imageUrl: user?.photoURL),
                              SizedBox(height: 5.0),
                              EditPhoto(
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 17.0),
                        // used row to make it align to the left
                        Row(
                          children: [
                            Column(
                              children: <Widget>[
                                Text(
                                  "Full name",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        TextFieldInput(
                          disabled: true,
                          value: user!.displayName != null
                              ? user.displayName.toString()
                              : "Enter your name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter your Name";
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => Name = value),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Column(
                              children: <Widget>[
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        TextFieldInput(
                          value: user.email.toString(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter your Email";
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => Email = value),
                        ),
                        SizedBox(height: 17.0),
                        ChangePasswordButton(onTap: () => _showPasswordForm()),
                        SizedBox(height: 70.0),
                        SaveButton(onPress: () {
                          if (_formkey.currentState!.validate()) {
                            // setState(() => loading = true);
                            print("name ${user.displayName}");
                            print("email ${Email}");
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
