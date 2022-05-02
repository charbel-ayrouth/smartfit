import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:smartfit/services/profile_services.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:smartfit/shared/loading.dart';

class Profile extends StatelessWidget {
  final String? imageUrl;
  Profile({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final ProfileServices _profileServices = ProfileServices();
    String photoUrl = _profileServices.getProfileUrl(imageUrl!).toString();
    if (imageUrl != null) {
      // return FutureBuilder(
      //   future: _profileServices.getProfileUrl(imageUrl!),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return const Text("something went wrong");
      //     }
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return CircleAvatar(
      //         radius: 58.0,
      //         backgroundColor: kSecondaryOrange,
      //         child: CircleAvatar(
      //           radius: 52.0,
      //           backgroundImage: NetworkImage(snapshot.data.toString()),
      //         ),
      //       );
      //     }
      //     return Center(child: Loading());
      //   },
      // );
      return CircleAvatar(
        radius: 58.0,
        backgroundColor: kSecondaryOrange,
        child: CircleAvatar(
          radius: 52.0,
          backgroundImage:
              NetworkImage(_profileServices.getProfileUrl(photoUrl).toString()),
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
