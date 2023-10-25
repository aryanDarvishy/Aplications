import 'package:flutter/material.dart';
import 'package:weather_app/screens/started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartedScreen(),
    );
  }
}
