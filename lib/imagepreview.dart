import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:widget_mask/widget_mask.dart';
import 'dart:io';

class MaskWidget extends StatelessWidget {
  const MaskWidget(
      {super.key, required this.assetImage, required this.maskimage});

  final AssetImage assetImage;
  final CroppedFile? maskimage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: WidgetMask(
        blendMode: BlendMode.srcATop,
        childSaveLayer: true,
        mask: Image(
          image: FileImage(
            File(maskimage!.path),
          ),
          fit: BoxFit.fill,
        ),
        child: Image(
          image: assetImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}