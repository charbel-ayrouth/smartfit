// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class EditPhoto extends StatelessWidget {
  final void Function()? onTap;
  EditPhoto({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(
              text: 'Edit Photo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(
                  Icons.camera_alt,
                  color: kSecondaryOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
