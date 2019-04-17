import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';

class DonatePage extends StatelessWidget {
  TextEditingController donationAmount = TextEditingController();

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
                  width: MediaQuery.of(context).size.width -
                      100.0, // Subtract sums of padding and margins from actual width
                  child: new TextField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    controller: donationAmount,
                    decoration: new InputDecoration(
                      prefixText: '\$',
                      suffixText: '.00',
                      helperText: 'Enter Donation Amount',
                    ),
                  ),
                ),
              ],
            ),
            new Container(height: 90.0),
            RaisedButton(
              onPressed: () {
                String amount = donationAmount.text;
                int lastAmount = int.parse(amount);
                CartItemInfo donation = new CartItemInfo(
                  "Donation",
                  "for JAC",
                  lastAmount,
                  'url',
                );
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
