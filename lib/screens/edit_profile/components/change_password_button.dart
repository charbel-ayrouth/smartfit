import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class ChangePasswordButton extends StatelessWidget {
  final void Function()? onTap;
  ChangePasswordButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: const [
              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
