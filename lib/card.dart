import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widget_mask/widget_mask.dart';

class Popup extends StatelessWidget {
  Popup({super.key});

  File? _selectedimage;
  final imagepicker = ImagePicker();
  var pickedimage;

  void pickgallery() async {
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
      _selectedimage = File(pickedimage.path);

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedimage.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1.0, ratioY: 1.0), // Adjust aspect ratio as needed
        compressQuality: 100, // Adjust image quality
        maxWidth: 500, // Adjust maximum width
        maxHeight: 500, // Adjust maximum height
      );

      dialog(croppedFile!, context);
    }
  }

  void dialog(CroppedFile croppedFile, BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) => Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(255, 197, 197, 197),
            ),
          ),
          child: Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Image(
                    image: FileImage(
                      File(croppedFile.path),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 42, 120, 114)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Use this image",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    pickedimage = croppedFile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: pickedimage != null
          ? Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: MediaQuery.of(context).size.height * .5,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: WidgetMask(
                    blendMode: BlendMode.srcATop,
                    childSaveLayer: true,
                    mask: Image(
                      image: FileImage(
                        File(pickedimage.path),
                      ),
                      fit: BoxFit.fill,
                    ),
                    child: const Image(
                      image: AssetImage(
                        "asset/user_image_frame_1.png",
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Text(""),
    );
  }
}
