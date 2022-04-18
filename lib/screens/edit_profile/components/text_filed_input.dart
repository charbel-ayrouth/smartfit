import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final String text;
  final bool obscure;
  TextFieldInput({required this.text, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0x99CBCBCB),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
