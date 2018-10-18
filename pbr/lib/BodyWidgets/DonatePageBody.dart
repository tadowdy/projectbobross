import 'package:flutter/material.dart';

class DonatePageBody extends StatelessWidget {
  DonatePageBody();

  void _switchViewToCheckoutDetailsPage(/*Cart cart*/) {
    // TODO: create new CheckoutDetailsPage w. artwork..
    // TODO: build and push the ArtworkDetailsPage onto the nav stack..
  }

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
            "Put the Donation Details Here..",
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
