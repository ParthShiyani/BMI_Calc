import 'package:bmi_animation/screens/home_page.dart';
import 'package:bmi_animation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => Splashscreen(),
        '/': (context) => HomePage(),
      },
    ),
  );
}
