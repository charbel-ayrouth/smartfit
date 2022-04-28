import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class SignInWith extends StatelessWidget {
  final IconData icon1;
  final String title;
  final void Function()? onTap;
  const SignInWith(
      {Key? key, required this.icon1, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        primary: kPrimaryColor,
      ),
      onPressed: onTap,
      icon: Icon(
        // <-- Icon
        icon1,
        size: 24.0,
      ),
      label: Text(title), // <-- Text
    );
  }
}
