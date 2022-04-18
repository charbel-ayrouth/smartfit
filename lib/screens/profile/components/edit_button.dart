import 'package:flutter/material.dart';
import 'package:smartfit/screens/edit_profile/edit_profile_page.dart';
import 'package:smartfit/shared/constants.dart';

class EditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.0,
      backgroundColor: Colors.orange[200],
      child: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ));
        },
        icon: Icon(
          Icons.edit,
          color: kPrimaryColor,
          size: 20,
        ),
      ),
    );
  }
}
