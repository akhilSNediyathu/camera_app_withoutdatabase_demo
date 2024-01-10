import 'package:camera/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Mycolor.dark,
      ),
      home: const HomePage(),
    );
  }
}

class Mycolor {
  static const MaterialColor dark = MaterialColor(
    0xff000000,
    <int, Color>{
      50: Color(0xff000000),
      100: Color(0xff000000),
      200: Color(0xff000000),
      300: Color(0xff000000),
      400: Color(0xff000000),
      500: Color(0xff000000),
      600: Color(0xff000000),
      700: Color(0xff000000),
      800: Color(0xff000000),
      900: Color(0xff000000),
    },
  );
}
