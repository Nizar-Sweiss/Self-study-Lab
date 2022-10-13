import 'package:flutter/material.dart';
import 'package:main/Screens/screens.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

// ramzi
