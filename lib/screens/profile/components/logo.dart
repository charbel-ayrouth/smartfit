import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      child: Image.asset(
        "assets/images/Logo.png",
        height: 30,
        width: 60,
      ),
    );
  }
}
