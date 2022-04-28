import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class TextFieldInput extends StatelessWidget {
  final String? text;
  final bool? enabled;
  final String? value;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final void Function(String)? onChanged;
  final Widget? SuffixIcon1;
  TextFieldInput({
    this.text,
    this.value,
    this.validator,
    this.enabled,
    this.controller,
    this.obscure = false,
    required this.onChanged,
    this.SuffixIcon1,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextFormField(
        enabled: enabled,
        initialValue: value,
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: kHintTextColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          suffixIcon: SuffixIcon1,
        ),
      ),
    );
  }
}
