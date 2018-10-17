import 'package:flutter/material.dart';

final topAppBar = new AppBar(
          title: new Image(image: new AssetImage('images/full_logo.png')),
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

final topAppBarCart = new AppBar(
          title: new Column(
            children: <Widget>[
              Image(image: new AssetImage('images/full_logo.png')),
              Text(
              r"Your total is $235.23",
                style: new TextStyle(fontSize:30.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto"),
              ),
            ],
          ), 
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.camera_alt),
              tooltip: 'QR scan',
              onPressed: () {
              },
            ),
            
          ],
        );