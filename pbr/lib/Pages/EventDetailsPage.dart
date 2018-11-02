import 'package:flutter/material.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';

class EventDetailsPage extends StatelessWidget {
  void _addEventToCart(/*Event event*/) {
    // TODO: add the event to the cart.
    // TODO: notify the user whether the event was added to the cart using a popup.
  }

  void _signUpForEvent(/*Event event*/) {
    // TODO: sign up the user for the event.
    // TODO: notify the user whether the event sign up was successful using a popup.
  }

  @override
  Widget build(BuildContext context) {
    return buildBody;
  }
}

final buildBody = new Scaffold(
    body: new Stack(fit: StackFit.expand, children: [
  addTimeDate,
  addDescription,
]));

final addTimeDate = new SingleChildScrollView(
  child: new Container(
    margin: const EdgeInsets.symmetric(vertical: topPadding, horizontal: 10.0),
    child: new Row(
      children: <Widget>[
        new Expanded(
            child: new Text("Location", style: new TextStyle(fontSize: 30.0))),
        new Text(
          "Date/Time",
          style: new TextStyle(fontSize: 25.0),
        ),
      ],
    ),
  ),
);

final addDescription = new SingleChildScrollView(
    child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
        child: new Column(children: <Widget>[
          new Text("Price", style: new TextStyle(fontSize: 25.0)),
          new Text(
            "Description",
            style: new TextStyle(
              fontSize: 25.0,
            ),
          ),
          new Text(
              "Short description stating what the class is about and who it is intended for."),
          ButtonTheme(
            minWidth: 50.0,
            height: 30.0,
            child: RaisedButton(
              onPressed: () {
                // add email to db
              },
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Text(
                      'Buy Tickets',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ])));
