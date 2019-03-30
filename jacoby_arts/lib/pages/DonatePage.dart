import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/widgets/CartPageBody.dart';
import 'package:jacoby_arts/Auxiliary/CartClasses.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';

// TODO: can't return a scaffold, will need to be refactored to container
class DonatePage extends StatelessWidget {
  int donation_amount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    //height: double.infinity, //This is extra
                    width: MediaQuery.of(context).size.width - 100.0, // Subtract sums of paddings and margins from actual width 
                    //TODO: see if textField can pop up numbers only keypad instead
                    child: new TextField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          hintText: 'Enter Donation Amount'),

                    ),
                  ),
              ],
            ),
            new Container(height: 90.0),
            RaisedButton(
              onPressed: () {

                //cart.addDonationToCart(new ArtInfo("Donation", "for Jacoby Arts Center", 10.00));
                Navigator.pop(context);
              },
              child: Text('Give Us Your Money!'),
            )
          ],
        ),
      ),
    );
  }
}