import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:jacoby_arts/widgets/CartPageBody.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';


// TODO: can't return a scaffold, will need to be refactored to container
class DonatePage extends StatelessWidget {
  TextEditingController donation_amount = TextEditingController();

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
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        suffixText: '.00',
                        hintText: 'Enter Donation Amount'),
                        controller: donation_amount,
                    ),
                  ),
              ],
            ),
            new Container(height: 90.0),
            RaisedButton(
              onPressed: () {
                
                String amount = donation_amount.text;
                int last_amount = int.parse(amount);
                CartItemInfo donation = new CartItemInfo("Donation", "for JAC", last_amount, 'url');
                addCartItem(donation);
                Navigator.pop(context);

              },
              child: Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}