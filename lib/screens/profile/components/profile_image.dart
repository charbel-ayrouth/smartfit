import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class Profile extends StatelessWidget {
  final String? imageUrl;
  Profile({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CircleAvatar(
        radius: 58.0,
        backgroundColor: kSecondaryOrange,
        child: CircleAvatar(
          radius: 52.0,
          backgroundImage: NetworkImage(imageUrl!),
        ),
      );
    } else {
      return const CircleAvatar(
        radius: 58.0,
        backgroundColor: kSecondaryOrange,
        child: CircleAvatar(
          radius: 52.0,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
      );
    }
  }
}
