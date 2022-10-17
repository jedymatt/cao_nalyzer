import 'package:camera/camera.dart';
import 'package:cao_nalyzer/screens/take_picture_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final cameras = await availableCameras();
          final firstCamera = cameras.first;

          if (!mounted) return;

          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TakePictureScreen(camera: firstCamera),
            ),
          );
        },
        isExtended: true,
        label: const Text('Scan Cacao Beans'),
        icon: const Icon(Icons.camera_alt),
        tooltip: 'Scan Cacao Beans',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
