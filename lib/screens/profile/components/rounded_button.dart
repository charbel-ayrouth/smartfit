import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final void Function() function;
  RoundedButton({
    required this.text,
    required this.function,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 20,
        child: ListTile(
          trailing: Icon(
            iconData,
            color: kPrimaryColor,
            size: 35.0,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
