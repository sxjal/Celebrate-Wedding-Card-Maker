import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:celebrate/imageinput.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  const HomeScreen({super.key});
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
      body: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _pickedImage;

  // _loadPicker(ImageSource source) async {
  //   XFile photo = ImagePicker().pickImage(source: source) as XFile;
  //   File picked = File(photo.path);

  //   _cropImage(picked);
  //   Navigator.pop(context);
  // }

  // _cropImage(File picked) async {
  //   CroppedFile? some = await ImageCropper().cropImage(
  //     sourcePath: picked.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio16x9,
  //       CropAspectRatioPreset.ratio4x3,
  //     ],
  //     maxWidth: 800,
  //   );
  //   File cropped = File(some!.path);

  //   setState(() {
  //     _pickedImage = cropped;
  //   });
  // }

  // void _showPickOptionsDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           ListTile(
  //             title: const Text("Pick from Gallery"),
  //             onTap: () {
  //               _loadPicker(ImageSource.gallery);
  //             },
  //           ),
  //           ListTile(
  //             title: const Text("Take a pictuer"),
  //             onTap: () {
  //               _loadPicker(ImageSource.camera);
  //             },
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage:
                  _pickedImage != null ? FileImage(_pickedImage!) : null,
              child: _pickedImage == null ? const Text("Picture") : null,
            ),
          ),
          const SizedBox(height: 10.0),
          ImageInput(onimageadd: (addedimage) {
            _pickedImage = addedimage;
          }),
          // ElevatedButton(
          //   child: const Text("Pick Image"),
          //   onPressed: () {
          //     _showPickOptionsDialog(context);
          //   },
          // )
        ],
      ),
    );
  }
}
