import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatelessWidget {
  var eventData;
  EventDetailsPage({ this.eventData});
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
    return buildBody(context,eventData);
  }
}

buildBody(BuildContext context, eventData){
  return new Scaffold(
          appBar: new AppBar(
          title: new Text(eventData.title)
          ),
    body: new Stack(fit: StackFit.expand, children: [
  addTimeDate(context, eventData),
  addDescription(context,eventData),
]));
}
addTimeDate(BuildContext context, eventData){
  var time = eventData.date.replaceAll(new RegExp(r'-'), '');
  var time1 = time.replaceAll(new RegExp(r':'), '');
  var time2 = time1.substring(0,15);
  DateTime date = DateTime.parse(time2);
  final _date = new DateFormat.yMMMd().format(date);
  final _time = new DateFormat.jm().format(date);
  return new SingleChildScrollView(
  child: new Container(
    margin: const EdgeInsets.only(
        top: topPadding, left: horizontalPadding, right: horizontalPadding, bottom: verticalWidgetPadding),
    child: new Row(
      children: <Widget>[
        new Expanded(child: new Text(eventData.location, style: headingOneBold)),
        new Text(
          _date + " " + _time,
          style: headingOneBold,
        ),
      ],
    ),
  ),
);
}
addDescription(BuildContext context, eventData){
   return new SingleChildScrollView(
    child: new Container(
        margin: const EdgeInsets.only(
            top: verticalWidgetPadding * 3.0,
            left: horizontalPadding,
            right: horizontalPadding),
        child: new Column(children: <Widget>[
          new Text(eventData.price.toString(), style: headingTwo),
          new Text(
            "Description",
            style: headingTwo,
          ),
          new Text(
            eventData.description,
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
}