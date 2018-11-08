import 'package:flutter/material.dart';
import 'AppLanding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';

void main() {
  runApp(new JACApp());
}

class JACApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PBR',
      theme: new ThemeData(
        primarySwatch: brightButton,
        primaryColor: Colors.blueGrey,
        accentColor: Colors.amberAccent,
        buttonColor: brightButton,
        canvasColor: const Color(0xFFfafafa),
        fontFamily: font,
      ),
      home: Home(),
    );
  }
}
