import 'package:flutter/material.dart';
import 'dart:io';

class MyWidget extends StatelessWidget {
  const MyWidget(
      {super.key, required this.assetImage, required this.maskimage});

  final AssetImage assetImage;
  final File maskimage;
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
            File(widget.pickedimage!.path),
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
