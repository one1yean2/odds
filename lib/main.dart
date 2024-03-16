import 'package:flutter/material.dart';
import 'package:odds/pages/gamesWeb.dart';

import 'package:odds/pages/homePage.dart';

import 'package:odds/pages/splashScreen.dart';

import 'pages/video.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
