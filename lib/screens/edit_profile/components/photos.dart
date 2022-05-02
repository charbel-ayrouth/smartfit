import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/services/profile_services.dart';
import 'package:smartfit/shared/constants.dart';

class Photos extends StatefulWidget {
  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  File? file;
  final imagePicker = ImagePicker();

  final ProfileServices _profileServices = ProfileServices();

  void selectImage(String id) async {
    final result =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
    if (result == null) return;
    file = File(result.path);
    if (file != null) {
      final filename = id + '.' + file!.path.split('.').last;
      final destination = 'Images/$filename';
      await FirebaseImages.uploadfile(destination, file!);
      _profileServices.updateProfile(filename);
      Navigator.of(context).pop();
    }
  }

  void takePhoto(String id) async {
    final image =
        await ImagePicker.platform.getImage(source: ImageSource.camera);
    file = File(image!.path);
    if (file != null) {
      final filename = id + '.' + file!.path.split('.').last;
      final destination = 'Images/$filename';
      FirebaseImages.uploadfile(destination, file!);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 140,
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Please choose your new profile picture",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectImage(user!.uid);
                  },
                  child: const Text("Pick a photo"),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                ),
                ElevatedButton(
                  onPressed: () {
                    takePhoto(user!.uid);
                  },
                  child: const Text("Take a photo"),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseImages {
  static UploadTask? uploadfile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException {
      return null;
    }
  }
}
