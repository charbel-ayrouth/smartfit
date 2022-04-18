// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

import '../profile/components/edit_photo.dart';
import '../profile/components/go_back_button.dart';
import '../profile/components/logo.dart';
import 'components/change_password_button.dart';
import 'components/save_button.dart';
import 'components/text_filed_input.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GoBackButton(),
                        Logo(),
                      ],
                    ),
                    CircleAvatar(
                      radius: 52.0,
                      backgroundColor: kSecondaryOrange,
                      child: CircleAvatar(
                        radius: 46.0,
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
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
              TextFieldInput(text: "Enter your full name", obscure: false),
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
                text: "Enter your E-mail address",
                obscure: true,
              ),
              SizedBox(height: 17.0),
              ChangePasswordButton(),
              SizedBox(height: 70.0),
              SaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
