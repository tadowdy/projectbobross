import 'package:flutter/material.dart';

class EventListPageBody extends StatelessWidget {
  EventListPageBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      //This is where the code for the body of your page will go
      child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            new Text(
            "Put the List of Events Here",
              style: new TextStyle(fontSize:30.0,
              color: const Color(0xFF080808),
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto"),
            ),
          ]
        ),
    );
  }
}