import 'package:flutter/material.dart';
import 'package:lab8/screens/calculoimc_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculoImcScreen(),
    );
  }
}
