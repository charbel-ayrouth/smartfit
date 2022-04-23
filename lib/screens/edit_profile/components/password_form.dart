import 'package:flutter/material.dart';
import 'package:smartfit/screens/edit_profile/components/text_field_input.dart';

class PasswordForm extends StatefulWidget {
  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: <Widget>[
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
            SizedBox(height: 5.0),
            TextFieldInput(onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
