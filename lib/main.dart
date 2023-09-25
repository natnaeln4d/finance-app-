import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/Screens/statistics.dart';
import 'package:flutter_application_1/widget/bottomNavigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  static const time = 0;

  void increment() {
    // Your increment logic here
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}




