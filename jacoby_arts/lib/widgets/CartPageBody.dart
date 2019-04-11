import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/DonatePage.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:square_in_app_payments/in_app_payments.dart';
// Put and alias due to name conflict
import 'package:square_in_app_payments/models.dart' as IAPModels;

class CartPageBody extends StatefulWidget {
  @override
  _CartPageBody createState() => _CartPageBody();
}

class _CartPageBody extends State<CartPageBody> {
  @override
  Widget build(BuildContext context) {
    List _cartItems = getCartItems();

    return Container(
      child: makeBody(context, _cartItems),
    );
  }

  Widget makeBody(BuildContext context, List<CartItemInfo> _cartItems) {
    return new ListView(
      children: <Widget>[
        _cartHeader(context, _cartItems),
        _buildCartItems(_cartItems),
        _checkoutButton(context),
      ],
    );
  }

  Widget _buildCartItems(List<CartItemInfo> _cartItems) {
    return new ListView.builder(
      physics: ClampingScrollPhysics(),
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
  Widget _itemRow(CartItemInfo item) {
    return InkWell(
        // make it clickable
        onTap: () {
          setState(() {
            removeCartItem(item);
          });
        },
        child: _makeCartItemCard(item));
  }

  Widget _makeCartItemCard(CartItemInfo item) {
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
                        right:
                            new BorderSide(width: 1.0, color: Colors.white))),
                child: new Image.network(
                  item.url,
                  height: 200,
                  width: 100,
                ),
              ),
              title: Text(
                item.artworkName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Text(
                      item.artistName +
                          " " +
                          "\n\$ " +
                          item.price.toStringAsFixed(2),
                      style: TextStyle(color: Colors.white)),
                  // Text(r"$" + item.price.toStringAsFixed(2),
                  //     style: TextStyle(color: Colors.white)),
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0))),
    );
  }

  Widget _cartHeader(BuildContext context, List<CartItemInfo> _cartItems) {
    double total = 0.00;
    String roundedTotal;
    for (CartItemInfo item in _cartItems) {
      total += item.price;
    }
    roundedTotal = total.toStringAsFixed(2);
    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Column(
            children: <Widget>[
              Text(
                "Current Total: " + r"$" + "$roundedTotal",
                style: headingThreeBold,
              ),
              new RaisedButton(
                child: const Text("Add Donation"),
                elevation: 4.0,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (__) => new DonatePage()));
                },
              )
            ],
          ),
        ]);
  }

  // void _switchViewToDonatePage(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => DonatePage(this)),
  //   );
  // }

  void addDonationToCart(CartItemInfo cartItem) {
    addCartItem(cartItem);
  }

  Future<void> chargeCard(IAPModels.CardDetails cardDetails) async {
    // charge card by call to server charge endpoint
    // set a easy charge endpoint by following this example:
    // https://github.com/square/in-app-payments-server-quickstart

    print(
        "charge doesn't actually happen, please set up charge endpiont server.");
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
