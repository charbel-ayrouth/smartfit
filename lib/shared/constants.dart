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
const kSecondaryOrange = Color(0x99F7931E);
const kInputColor = Color(0xFFfcd9b0);
const kGrey = Color(0x75919191);
const kHintTextColor = Color(0xFFCBCBCB);
const kWorkoutPrimaryColor = Color(0xFFFFF0DE);
