import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class GoBackButton extends StatelessWidget {
  final String displayText;
  GoBackButton({required this.displayText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
          Text(
            displayText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
