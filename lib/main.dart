import 'package:flutter/material.dart';

import 'screens/home.screen.dart';
import 'screens/loginFrom.screen.dart';
import 'screens/Login/rive_with_text.screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rive demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen(),
    );
  }
}
