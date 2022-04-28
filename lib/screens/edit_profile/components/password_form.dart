import 'package:flutter/material.dart';
import 'package:smartfit/screens/edit_profile/components/save_button.dart';
import 'package:smartfit/screens/edit_profile/components/text_field_input.dart';
import 'package:smartfit/screens/profile/components/go_back_button.dart';
import 'package:smartfit/services/profile_services.dart';

class PasswordForm extends StatefulWidget {
  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final ProfileServices _profileServices = ProfileServices();
  late bool checkCurrentPasswordValid;
  String oldPass = "";
  String newPass = "";
  String error = "";
  String confirmPass = "";
  bool _old = true;
  bool _new = true;
  bool _confirm = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: GoBackButton(displayText: "Go Back")),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30.0),
                  Row(
                    children: const [
                      Text(
                        "Old Password",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  TextFieldInput(
                      obscure: _old,
                      SuffixIcon1: IconButton(
                          icon: Icon(
                              _old ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _old = !_old;
                            });
                          }),
                      text: "Enter your old password",
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Enter a password 6+ char long';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => oldPass = value);
                      }),
                  const SizedBox(height: 14),
                  Row(
                    children: const [
                      Text(
                        "New Password",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  TextFieldInput(
                      obscure: _new,
                      SuffixIcon1: IconButton(
                          icon: Icon(
                              _new ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _new = !_new;
                            });
                          }),
                      text: "Enter your new password",
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Enter a password 6+ char long';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => newPass = value);
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
                  TextFieldInput(
                      obscure: _confirm,
                      SuffixIcon1: IconButton(
                          icon: Icon(_confirm
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _confirm = !_confirm;
                            });
                          }),
                      text: "Re-enter you new password",
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Enter a password 6+ char long';
                        }
                        if (value != newPass) {
                          return "Not Match";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => confirmPass = value);
                      }),
                  const SizedBox(height: 20.0),
                  SaveButton(
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        checkCurrentPasswordValid = await _profileServices
                            .validateCurrentPassword(oldPass);
                        if (checkCurrentPasswordValid == false) {
                          setState(() {
                            error = "password doesnt match";
                          });
                        }
                        if (checkCurrentPasswordValid == true) {
                          await _profileServices.updatePassword(newPass);
                          Navigator.of(context).pop();
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    error,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
