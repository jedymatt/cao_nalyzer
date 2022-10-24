import 'package:cao_nalyzer/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const CaoNalyzerApp());
}

class CaoNalyzerApp extends StatelessWidget {
  const CaoNalyzerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cao-nalyzer',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.brown,
      ),
      home: const HomeScreen(title: 'Cao-nalyzer'),
    );
  }
}
