// ignore_for_file: unused_field, prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:celebrate/imagepreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:image_picker/image_picker.dart";
import "package:image_cropper/image_cropper.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pickedmask = -1;
  File? _image;
  final imagepicker = ImagePicker();
  var pickedimage;
  CroppedFile? croppedFile;
  List<AssetImage> assetImage = const [
    AssetImage("asset/user_image_frame_1.png"),
    AssetImage("asset/user_image_frame_2.png"),
    AssetImage("asset/user_image_frame_3.png"),
    AssetImage("asset/user_image_frame_4.png"),
  ];
  void _pickgallery() async {
    pickedimage = await imagepicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    _onpickimage(pickedimage);
  }

  void _onpickimage(var pickedimage) async {
    if (pickedimage == null) {
      return;
    } else {
      _image = File(pickedimage.path);

      croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedimage.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1.0, ratioY: 1.0), // Adjust aspect ratio as needed
        compressQuality: 100, // Adjust image quality
        maxWidth: 500, // Adjust maximum width
        maxHeight: 500, // Adjust maximum height
      );
    }

    dialog();
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (builder) {
        pickedmask = -1;
        return AlertDialog(
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setpresentstate) {
            print("buidlider called");
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    iconSize: MediaQuery.of(context).size.width * .08,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                const Text(
                  "Uploaded Image",
                ),
                MaskWidget(
                  mask: pickedmask,
                  maskimage: croppedFile,
                  screen: 1,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size(10, 10),
                        ),
                      ),
                      child: const Text(
                        "Original Image",
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                      onPressed: () {
                        setpresentstate(() {
                          setState(() {
                            pickedmask = -1;
                          });
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size(10, 10),
                        ),
                      ),
                      child: Image(
                        image: assetImage[0],
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        setpresentstate(() {
                          setState(() {
                            pickedmask = 0;
                          });
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size(10, 10),
                        ),
                      ),
                      child: Image(
                        image: assetImage[1],
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        setpresentstate(() {
                          setState(() {
                            pickedmask = 1;
                          });
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size(10, 10),
                        ),
                      ),
                      child: Image(
                        image: assetImage[2],
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        setpresentstate(() {
                          setState(() {
                            pickedmask = 2;
                          });
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(10, 30),
                        ),
                      ),
                      child: Image(
                        image: assetImage[3],
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        setpresentstate(() {
                          setState(() {
                            pickedmask = 3;
                          });
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    // fixedSize: MaterialStateProperty.all(
                    //   const Size(80, 10),
                    // ),
                    // iconSize: MaterialStateProperty.all(10),
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 42, 120, 114),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Use this image"),
                ),
              ],
            );
          }),
        );
      },
    );
  }

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
          croppedFile != null
              ? MaskWidget(
                  mask: pickedmask,
                  maskimage: croppedFile,
                  screen: 2,
                )
              : const Text(""),
        ],
      ),
    );
  }
}
