
import 'dart:io';
import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget {
  final String imagePath;

  PhotoViewPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Photo")),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}
