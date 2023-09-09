import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            SystemNavigator.pop();
            exit(0);
          },
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Add Image/Icon"),
      ),
      //body: Text("Home Screen"),
    );
  }
}
