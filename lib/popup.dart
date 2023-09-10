import 'package:celebrate/imagepreview.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget({super.key, required this.pickedimage});

  final CroppedFile? pickedimage;

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  var pickedmask = 0;
  List<AssetImage> assetImage = const [
    AssetImage("asset/user_image_frame_1.png"),
    AssetImage("asset/user_image_frame_2.png"),
    AssetImage("asset/user_image_frame_3.png"),
    AssetImage("asset/user_image_frame_4.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: MaskWidget(
                  assetImage: assetImage[pickedmask],
                  maskimage: widget.pickedimage,
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
    );
  }
}
