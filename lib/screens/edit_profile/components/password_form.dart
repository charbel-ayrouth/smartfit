import 'package:flutter/material.dart';
import 'package:smartfit/screens/edit_profile/components/change_password_button.dart';
import 'package:smartfit/screens/edit_profile/components/text_field_input.dart';

class PasswordForm extends StatefulWidget {
  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

late String oldPassword;
late String newPassword;
late String confirmNewPassword;

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: const <Widget>[
                  Text(
                    "Old Password",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          TextFieldInput(onChanged: (value) {
            setState(() {
              newPassword = value;
            });
          }),
          const SizedBox(height: 14),
          Row(
            children: [
              Column(
                children: const <Widget>[
                  Text(
                    "New Password",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          TextFieldInput(onChanged: (value) {
            setState(() {
              newPassword = value;
            });
          }),
          const SizedBox(height: 14),
          Row(
            children: [
              Column(
                children: const <Widget>[
                  Text(
                    "Confirm New Password",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          TextFieldInput(onChanged: (value) {
            setState(() {
              newPassword = value;
            });
          }),
          const SizedBox(height: 10.0),
          ChangePasswordButton()
        ],
      ),
    );
  }
}
