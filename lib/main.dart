import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HomePage(),
    );
  }
}
