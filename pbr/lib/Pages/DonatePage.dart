import 'package:flutter/material.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';
import 'package:pbr/BodyWidgets/CartPageBody.dart';
import 'package:pbr/Auxiliary/CartClasses.dart';

// TODO: can't return a scaffold, will need to be refactored to container
class DonatePage extends StatelessWidget {

// TODO: look into this strategy
  CartPageBody cart;

  DonatePage(CartPageBody cart){
    this.cart = cart;
  }

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
                cart.addDonationToCart(new ArtInfo("Donation", "for Jacoby Arts Center", 10.00));
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

