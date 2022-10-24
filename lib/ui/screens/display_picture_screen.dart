import 'dart:io';

import 'package:flutter/material.dart';

import 'scan_picture_screen.dart';

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
        actions: [
          IconButton(
            icon: const Icon(Icons.document_scanner),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScanPictureScreen(
                    imagePath: imagePath,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
