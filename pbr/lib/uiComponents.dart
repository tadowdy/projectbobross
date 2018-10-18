import 'package:flutter/material.dart';

// TODO: move to auxiliary
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