import 'dart:io';

import 'package:flutter/material.dart';

class ScanPictureScreen extends StatelessWidget {
  const ScanPictureScreen({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan the Picture'),
        actions: [
          TextButton.icon(
            onPressed: () => {},
            icon: const Icon(Icons.save),
            label: const Text('Save result'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(imagePath)),
          ],
        ),
      ),
    );
  }
}
