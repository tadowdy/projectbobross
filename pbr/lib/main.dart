import 'package:flutter/material.dart';
import 'AppLanding.dart';

void main() {
  runApp(new JACApp());
}
class JACApp extends StatelessWidget {

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
