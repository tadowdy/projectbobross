import 'package:flutter/material.dart';

// static options
final themeColor = Colors.blueGrey[300];
final appBarColor = themeColor;
final iconColor = Colors.black38;
final iconSelectedColor = Colors.black;

// static components
final topAppBar = new AppBar(
  title: new Image(image: new AssetImage('images/full_logo.png')),
  backgroundColor: themeColor,
  actions: <Widget>[
    new IconButton(
      icon: new Icon(Icons.camera_alt),
      tooltip: 'QR scan',
      onPressed: () {
        /////go to camera
      },
    ),
  ],
);
