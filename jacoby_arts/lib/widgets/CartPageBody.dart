import 'package:flutter/material.dart';
import 'package:jacoby_arts/Pages/DonatePage.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:square_in_app_payments/in_app_payments.dart';
// Put and alias due to name conflict
import 'package:square_in_app_payments/models.dart' as IAPModels;

final _cartItems = <ArtInfo>[
  new ArtInfo("We are Number One", "Robbie Rotten", 1.11),
  new ArtInfo("I Was Number One", "Smitty Werbenjagermanjensen", 1.00),
  new ArtInfo("The One", "Neo", 10011.10),
];

class CartPageBody extends StatelessWidget {
  
  CartPageBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: makeBody(context, _cartItems),
    );
  }

  Widget makeBody(BuildContext context, List<ArtInfo> _cartItems) {
    return new Column(
      children: <Widget>[
        _cartHeader(context, _cartItems),
        _buildCartItems(_cartItems),
        _checkoutButton(context),
      ],
    );
  }

  Widget _buildCartItems(List<ArtInfo> _cartItems) {
    return ListView.builder(
      padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: verticalWidgetPadding),
      shrinkWrap: true,
      itemCount: _cartItems.length,
      itemBuilder: (context, i) {
        return _itemRow(_cartItems[i]);
      },
    );
  }

  //TODO: ArtInfo will actually have to be CartItems as not every cart item will be art
  Widget _itemRow(ArtInfo item) {
    return InkWell(
        // make it clickable
        onTap: () {
          // TODO: direct user to item details on tap
        },
        child: _makeCartItemCard(item));
  }

  Widget _makeCartItemCard(ArtInfo item) {
    return new Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: cardPadding),
      child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  // create a inset for the image
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white))),
              child: Icon(Icons.image, color: Colors.white),
            ),
            title: Text(
              item.artworkName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text(item.artistName + "     ",
                    style: TextStyle(color: Colors.white)),
                Text(r"$" + item.price.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          )),
    );
  }

  Widget _cartHeader(BuildContext context, List<ArtInfo> _cartItems) {
    double total = 0.00;
    String roundedTotal;
    for (ArtInfo item in _cartItems) {
      total += item.price;
    }
    roundedTotal = total.toStringAsFixed(2);
    return new Row(
      children: <Widget>[
        new Container(width: horizontalPadding),
        Text(
          "Current Total: " + r"$" + "$roundedTotal",
          style: headingThreeBold,
        ),
        new Container(width: 20.0),
        new RaisedButton(
          child: const Text("Add Donation!"),
          elevation: 4.0,
          onPressed: () {
            //_switchViewToDonatePage(context);
          },
        ),
      ],
    );
  }

  // void _switchViewToDonatePage(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => DonatePage(this)),
  //   );
  // }

  void addDonationToCart(ArtInfo cartItem) {
    _cartItems.add(cartItem);
  }

  Future<void> chargeCard(IAPModels.CardDetails cardDetails) async {
    // charge card by call to server charge endpoint
    // set a easy charge endpoint by following this example:
    // https://github.com/square/in-app-payments-server-quickstart
    
    print("charge doesn't actually happen, please set up charge endpiont server.");
    //// An example code to call your server api to charge
    // var chargeUrl = "REPLACE_ME";
    // var body = jsonEncode({"nonce": cardDetails.nonce});
    // http.Response response;
    // try {
    //   response = await http.post(chargeUrl, body: body, headers: {
    //     "Accept": "application/json",
    //     "content-type": "application/json"
    //   });
    // } on SocketException catch (ex) {
    //   throw ex;
    // }

    // var responseBody = json.decode(response.body);
    // if (response.statusCode == 200) {
    //   // handle response
    //   return;
    // } else {
    //   throw Exception("failed to charge");
    // }
  }

  void _onCardEntryCardNonceRequestSuccess(IAPModels.CardDetails result) async {
    try {
      await chargeCard(result);
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on Exception catch (ex) {
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }

  Future<void> _onStartCardEntryFlow() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow,
        collectPostalCode: true);
  }

  void _onCancelCardEntryFlow() {
    print("payment canceled");
  }

  void _onCardEntryComplete() {
    print("card entry UI is closed completely.");
  }

  Future<void> _onStartCardEntry() async {
    print("start card entry clicked.");
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow,
        collectPostalCode: true);
  } 

  Widget _checkoutButton(context) {
    return new ButtonTheme(
      child: new Container(
        width: largeButtonWidth,
        height: buttonHeight,
        child: new RaisedButton(
          color: brightButton,
          child: new Text(
            "Checkout",
            style: new TextStyle(fontSize: buttonTextSize),
          ),
          elevation: 4.0,
          onPressed: _onStartCardEntry,
        ),
      ),
    );
  }
}


