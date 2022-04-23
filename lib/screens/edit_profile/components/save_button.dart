import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onPress;
  SaveButton({
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: onPress,
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }
}
