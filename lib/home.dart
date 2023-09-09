// ignore_for_file: unused_field, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xen_popup_card/xen_card.dart';
import "package:image_picker/image_picker.dart";
import "package:image_cropper/image_cropper.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _selectedimage;
  final imagepicker = ImagePicker();
  var pickedimage;

  void _pickgallery() async {
    pickedimage = await imagepicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    _onpickimage(pickedimage);
  }

  void _onpickimage(var pickedimage) async {
    print("In _onpickimage");
    if (pickedimage == null) {
      print("inside if");
      return;
    } else {
      print("inside else");
      _selectedimage = File(pickedimage.path);

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedimage.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1.0, ratioY: 1.0), // Adjust aspect ratio as needed
        compressQuality: 100, // Adjust image quality
        maxWidth: 500, // Adjust maximum width
        maxHeight: 500, // Adjust maximum height
      );
      //image in here
      print("croppedFile");
      dialog(croppedFile!);
    }
  }

  void dialog(CroppedFile croppedFile) {
    showDialog(
      context: context,
      builder: (builder) => XenPopupCard(
        appBar: appBar,
        gutter: gutter,
        body: ListView(
          children: [
            const Text("body"),
            Image(
              image: FileImage(
                File(croppedFile.path),
              ),
            )
          ],
        ),
      ),
    );
  }

  XenCardAppBar appBar = const XenCardAppBar(
    // To remove shadow from appbar
    shadow: BoxShadow(color: Colors.transparent),
    child: Text(
      "app bar",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
    ),
  );

  XenCardGutter gutter = XenCardGutter(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        child: const Text("close"),
        onPressed: () {},
      ),
    ),
  );

  Widget cardWithGutterAndAppBar() => TextButton(
        onPressed: () => () {},
        child: const Text("open card with gutter and app bar"),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Platform.isAndroid
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  SystemNavigator.pop();
                },
              )
            : IconButton(
                iconSize: 0,
                icon: const Icon(Icons.check_box_outline_blank),
                onPressed: () {
                  //  Navigator.pop(context);
                },
              ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("Add Image/Icon"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromARGB(255, 197, 197, 197)),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Upload Image",
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 42, 120, 114)),
                  ),
                  onPressed: _pickgallery,
                  child: const Text(
                    "Choose from Device",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          pickedimage != null
              ? Image(
                  image: FileImage(pickedimage!),
                )
              : const Text(""),
        ],
      ),
    );
  }
}
