import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
            Text(
              "Edit Account",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
