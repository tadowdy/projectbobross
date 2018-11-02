import 'package:flutter/material.dart';

// static options
final themeColor = Colors.blueGrey[300];
final appBarColor = themeColor;
final iconColor = Colors.black38;
final iconSelectedColor = Colors.black;
final font = "Roboto";

// number constants must be declared const
// padding constants
const topPadding = 15.0;
const horizontalPadding = 5.0;
const imgWidth = 400.0;
const imgHeight = 500.0;

// text constants
const headingOne = 25.0;
const headingTwo = 20.0;
const headingThree = 15.0;
const contentTextSize = 10.0;

// static components
final topAppBar = new AppBar(
  title: new Image(image: new AssetImage('images/full_logo.png')),
  backgroundColor: themeColor,
  actions: <Widget>[
    new IconButton(
      icon: new Icon(Icons.camera_alt),
      tooltip: 'QR scan',
      onPressed: () {
        //TODO: go to camera
      },
    ),
  ],
);
