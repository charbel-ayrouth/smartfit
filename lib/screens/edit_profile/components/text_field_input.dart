import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final bool? enabled;
  final String? value;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const TextFieldInput({
    this.value,
    this.validator,
    this.enabled,
    required this.onChanged,
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
        decoration: InputDecoration(
          // hintText: text,
          // hintStyle: TextStyle(
          //   fontSize: 16.0,
          //   fontWeight: FontWeight.w600,
          //   color: Color(0x99CBCBCB),
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
