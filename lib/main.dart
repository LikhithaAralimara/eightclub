import 'package:eightclub/experienceSelectionPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: ExperienceSelectionScreen()
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

