import 'package:camera/camera.dart';
import 'package:cao_nalyzer/ui/screens/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // method to change Navigation bar index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final views = [
    const HomeView(),
    const ResultsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: views[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Results',
          ),
        ],
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Analyze the cacao beans:"),
          ElevatedButton.icon(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              final cameras = await availableCameras();
              final firstCamera = cameras.first;

              if (!mounted) return;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TakePictureScreen(
                    camera: firstCamera,
                  ),
                ),
              );
            },
            label: const Text("Take a picture"),
          ),
          const Text('or'),
          OutlinedButton.icon(
            icon: const Icon(Icons.image),
            onPressed: () async {
              final XFile? pickedImage =
                  await _picker.pickImage(source: ImageSource.gallery);
            },
            label: const Text('Select an image'),
          ),
        ],
      ),
    );
  }
}

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
