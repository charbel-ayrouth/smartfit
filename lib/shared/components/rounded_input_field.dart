import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  RoundedInputField({
    required this.hintText,
    required this.icon,
    required this.validator,
    required this.onChanged,
    required this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
            )),
        validator: validator,
        onChanged: onChanged,
        controller: controller,
      ),
    );
  }
}
