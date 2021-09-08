import 'package:flutter/material.dart';

import 'views/Login/login.view.dart';

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
