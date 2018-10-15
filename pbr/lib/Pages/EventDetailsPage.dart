import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: new AppBar(
          title: new Text('Event Details')
      ),
      body: Center(
        child: Text('Put the Event Details Here..'),
      ),
    );
  }
}
