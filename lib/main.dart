import 'package:example_app/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Example App',
      theme: new ThemeData.dark(),
      home: new HomePage(),
    );
  }
}