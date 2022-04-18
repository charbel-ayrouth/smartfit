import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ElevatedButton(
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                primary: kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
