import 'package:flutter/material.dart';

// static options
final themeColor = Colors.blueGrey[300];
final appBarColor = themeColor;
final iconColor = Colors.black38;
final iconSelectedColor = Colors.black;
final font = "Roboto";

// button
const brightButton = Colors.amber;
const normalButton = Color(0xFFD6D6D6);
final buttonTextSize = 18.0;
final largeButtonWidth = 175.0;
final buttonHeight = 40.0;
final medButtonWidth = 30.0;
final smButtonWidth = 20.0;

// number constants must be declared const
// padding constants
const topPadding = 15.0;
const horizontalPadding = 5.0;
const verticalWidgetPadding = 20.0;
const cardPadding = 6.0;
const imgWidth = 400.0;
const imgHeight = 500.0;

// text size constants
const headingOneSize = 27.0;
const headingTwoSize = 22.0;
const headingThreeSize = 20.0;
const contentTextSize = 13.0;

// text Styles
final headingOneBold = new TextStyle(
  fontSize: headingOneSize,
  fontWeight: FontWeight.bold,
);
final headingOne = new TextStyle(
  fontSize: headingOneSize,
  fontWeight: FontWeight.normal,
);
final headingTwoBold = new TextStyle(
  fontSize: headingTwoSize,
  fontWeight: FontWeight.bold,
);
final headingTwo = new TextStyle(
  fontSize: headingTwoSize,
  fontWeight: FontWeight.normal,
);
final headingThreeBold = new TextStyle(
  fontSize: headingThreeSize,
  fontWeight: FontWeight.bold,
);
final headingThree = new TextStyle(
  fontSize: headingThreeSize,
  fontWeight: FontWeight.normal,
);
final contentText = new TextStyle(
  fontSize: contentTextSize,
  fontWeight: FontWeight.normal,
);

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
