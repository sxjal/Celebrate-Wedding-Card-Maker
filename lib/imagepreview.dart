import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:widget_mask/widget_mask.dart';
import 'dart:io';

class MaskWidget extends StatelessWidget {
  const MaskWidget(
      {super.key,
      required this.mask,
      required this.maskimage,
      required this.screen});

  final int screen;
  final int mask;
  final CroppedFile? maskimage;
  @override
  Widget build(BuildContext context) {
    List<AssetImage> assetImage = const [
      AssetImage("asset/user_image_frame_1.png"),
      AssetImage("asset/user_image_frame_2.png"),
      AssetImage("asset/user_image_frame_3.png"),
      AssetImage("asset/user_image_frame_4.png"),
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width * .9,
      height: screen == 1 ? height * .2 : height * .3,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: WidgetMask(
        blendMode: mask == -1 ? BlendMode.src : BlendMode.srcATop,
        childSaveLayer: true,
        mask: Image(
          image: FileImage(
            File(maskimage!.path),
          ),
          fit: BoxFit.fill,
        ),
        child: mask == -1
            ? Image(
                image: FileImage(
                  File(maskimage!.path),
                ),
                fit: BoxFit.fill,
              )
            : Image(
                image: assetImage[mask],
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
