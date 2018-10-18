// Created on 10/11/2018
// Created by Taylor Dowdy

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  EventPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

final topAppBar = AppBar(
  actions: <Widget>[
    IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {}, // nothing happens when pressed
    )
  ],
);

final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      return makeCard; // make a card for the list
    }
  )
);

final makeCard = InkWell( // make it clickable
  onTap: (){
    new EventDetail(title: 'Event'); // create a event page if its clicked
  },
  child: Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: makeListTile,
      ),
  )
  );

final makeListTile = ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  leading: Container(
    padding: EdgeInsets.only(right: 12.0),
    decoration: new BoxDecoration( // create a inset for the image
        border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.white))),
    child: Icon(Icons.image, color: Colors.white),
  ),
  title: Text(
    "Art Name",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  subtitle: Row(
    children: <Widget>[
      Text(" Artist", style: TextStyle(color: Colors.white)),
      Text(" Price", style: TextStyle(color: Colors.white)),

    ],
  ),
  
  trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
  );

class EventDetail extends StatefulWidget {
  EventDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeDetailBody,
    );
  }
}

final makeDetailBody = Text("made it");