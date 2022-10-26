import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({Key? key}) : super(key: key);

  @override
  _AddPhotosState createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile picture'),
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                    color: Colors.black,
                    child: const Text("Pick Image from Gallery",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      pickImage();
                    }),
                MaterialButton(
                    color: Colors.black,
                    child: const Text("Pick Image from Camera",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      pickImageC();
                    }),
                const SizedBox(
                  height: 20,
                ),
                image != null
                    ? Image.file(image!)
                    : const Text("No image selected"),
              ]),
            )));
  }
}
