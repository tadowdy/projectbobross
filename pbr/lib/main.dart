import 'package:flutter/material.dart';
import 'App_landing.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PBR',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        accentColor: Colors.orange,
        canvasColor: const Color(0xFFfafafa),
      ),
      home: Home(),
    );
  }
}
