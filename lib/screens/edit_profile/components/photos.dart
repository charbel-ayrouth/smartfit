import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartfit/shared/constants.dart';

class Photos extends StatefulWidget {
  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  File? file;
  final imagePicker = ImagePicker();

  void selectImage() async {
    final result =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
    if (result == null) return;
    setState(() {
      file = File(result.path);
    });
    if (file != null) {
      final filename = file!.path.split('/').last;
      final destination = 'Images/$filename';
      FirebaseImages.uploadfile(destination, file!);
    }
  }

  void takePhoto() async {
    final image =
        await ImagePicker.platform.getImage(source: ImageSource.camera);
    setState(() {
      file = File(image!.path);
    });
    if (file != null) {
      final filename = file!.path.split('/').last;
      final destination = 'Images/$filename';
      FirebaseImages.uploadfile(destination, file!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Please choose your new profile picture",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectImage();
                  },
                  child: const Text("Pick a photo"),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                ),
                ElevatedButton(
                  onPressed: () {
                    takePhoto();
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
