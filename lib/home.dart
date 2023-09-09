import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:celebrate/imageinput.dart';
import 'package:flutter/material.dart';
import 'package:xen_popup_card/xen_card.dart';

// class HomeScreen extends StatelessWidget {
//   // This widget is the root of your application.
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Platform.isAndroid
//             ? IconButton(
//                 icon: const Icon(Icons.arrow_back_ios),
//                 onPressed: () {
//                   SystemNavigator.pop();
//                 },
//               )
//             : IconButton(
//                 iconSize: 0,
//                 icon: const Icon(Icons.check_box_outline_blank),
//                 onPressed: () {
//                   //  Navigator.pop(context);
//                 },
//               ),
//         backgroundColor: Colors.blueGrey,
//         centerTitle: true,
//         title: const Text("Add Image/Icon"),
//       ),
//       body: const ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File? _pickedImage;

//   // _loadPicker(ImageSource source) async {
//   //   XFile photo = ImagePicker().pickImage(source: source) as XFile;
//   //   File picked = File(photo.path);

//   //   _cropImage(picked);
//   //   Navigator.pop(context);
//   // }

//   // _cropImage(File picked) async {
//   //   CroppedFile? some = await ImageCropper().cropImage(
//   //     sourcePath: picked.path,
//   //     aspectRatioPresets: [
//   //       CropAspectRatioPreset.original,
//   //       CropAspectRatioPreset.ratio16x9,
//   //       CropAspectRatioPreset.ratio4x3,
//   //     ],
//   //     maxWidth: 800,
//   //   );
//   //   File cropped = File(some!.path);

//   //   setState(() {
//   //     _pickedImage = cropped;
//   //   });
//   // }

//   // void _showPickOptionsDialog(BuildContext context) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (context) => AlertDialog(
//   //       content: Column(
//   //         mainAxisSize: MainAxisSize.min,
//   //         children: <Widget>[
//   //           ListTile(
//   //             title: const Text("Pick from Gallery"),
//   //             onTap: () {
//   //               _loadPicker(ImageSource.gallery);
//   //             },
//   //           ),
//   //           ListTile(
//   //             title: const Text("Take a pictuer"),
//   //             onTap: () {
//   //               _loadPicker(ImageSource.camera);
//   //             },
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Center(
//             child: CircleAvatar(
//               radius: 80,
//               backgroundImage:
//                   _pickedImage != null ? FileImage(_pickedImage!) : null,
//               child: _pickedImage == null ? const Text("Picture") : null,
//             ),
//           ),
//           const SizedBox(height: 10.0),
//           ImageInput(onimageadd: (addedimage) {
//             _pickedImage = addedimage;
//           }),
//           // ElevatedButton(
//           //   child: const Text("Pick Image"),
//           //   onPressed: () {
//           //     _showPickOptionsDialog(context);
//           //   },
//           // )
//         ],
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? pickedimage;
  @override
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
              border: Border.all(color: Color.fromARGB(255, 197, 197, 197)),
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
                  onPressed: () => showDialog(
                    context: context,
                    // builder: (builder) => XenPopupCard(
                    //     appBar: appBar, gutter: gutter, body: Text("Sajal")),
                    builder: (context) => Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(255, 197, 197, 197),
                          ),
                        ),
                      ),
                    ),
                  ),
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
