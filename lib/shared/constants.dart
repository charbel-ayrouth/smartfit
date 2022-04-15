import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kInputColor, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
);

const kPrimaryColor = Color(0xFFF7931E);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kInputColor = Color(0xFFfcd9b0);
