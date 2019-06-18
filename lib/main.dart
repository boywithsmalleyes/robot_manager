import 'package:flutter/material.dart';
import 'package:robot_manager/splash/splash_page.dart';

void main() => runApp(RobotManagerApp());

class RobotManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        body: SplashPage(),
      ),
    );
  }
}


