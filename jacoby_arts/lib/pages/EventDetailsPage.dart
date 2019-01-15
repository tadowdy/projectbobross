import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';

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
    margin: const EdgeInsets.only(
        top: topPadding, left: horizontalPadding, right: horizontalPadding, bottom: verticalWidgetPadding),
    child: new Row(
      children: <Widget>[
        new Expanded(child: new Text("Location", style: headingOneBold)),
        new Text(
          "Date/Time",
          style: headingOneBold,
        ),
      ],
    ),
  ),
);

final addDescription = new SingleChildScrollView(
    child: new Container(
        margin: const EdgeInsets.only(
            top: verticalWidgetPadding * 3.0,
            left: horizontalPadding,
            right: horizontalPadding),
        child: new Column(children: <Widget>[
          new Text("Price", style: headingTwo),
          new Text(
            "Description",
            style: headingTwo,
          ),
          new Text(
            "Short description stating what the class is about and who it is intended for.",
            style: contentText,
          ),
          ButtonTheme(
            minWidth: largeButtonWidth,
            height: buttonHeight,
            child: RaisedButton(
              onPressed: () {
                // add event to cart
              },
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: horizontalPadding, left: horizontalPadding),
                    child: Text(
                      'Buy Tickets',
                      style: headingThree,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ])));
