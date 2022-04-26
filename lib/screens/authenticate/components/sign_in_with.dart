import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class SignInWith extends StatelessWidget {
  final IconData icon1;
  final void Function()? onTap;
  SignInWith({required this.icon1, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: kPrimaryColor,
      ),
      onPressed: onTap,
      icon: Icon(
        // <-- Icon
        icon1,
        size: 24.0,
      ),
      label: const Text('Log in with Facebook'), // <-- Text
    );
  }
}
