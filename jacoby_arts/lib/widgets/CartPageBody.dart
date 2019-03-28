import 'package:flutter/material.dart';
import 'package:jacoby_arts/Pages/DonatePage.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';

class CartPageBody extends StatefulWidget {
  @override
  _CartPageBody createState() => _CartPageBody();
}


class _CartPageBody extends StatefulWidget {
  @override
  Widget build(BuildContext context) {

      List _cartItems = getCartItems();
      debugPrint(_cartItems.toString());
    return Container(
      child: makeBody(context, _cartItems),
    );
  }
  
  
  Widget makeBody(BuildContext context, List<Artwork> _cartItems) {
    return new Column(
      children: <Widget>[
        _cartHeader(context, _cartItems),
        _buildCartItems(context, _cartItems)
      ],
    );
  }

  Widget _buildCartItems(BuildContext context, List<Artwork> _cartItems) {
    return ListView.builder(
      padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: verticalWidgetPadding),
      shrinkWrap: true,
      itemCount: _cartItems.length,
      itemBuilder: (context, i) {
        return _itemRow(context, _cartItems[i]);
      },
    );
  }

  //TODO: ArtInfo will actually have to be CartItems as not every cart item will be art
  Widget _itemRow(BuildContext context, Artwork item) {
    return InkWell(
        // make it clickable
        onTap: () {
          // TODO: direct user to item details on tap
        },
        child: _makeCartItemCard(context, item));
  }

  Widget _makeCartItemCard(BuildContext context, Artwork item) {
        return new InkWell(
        // make it clickable
        onTap: () {
          removeCartItem(item);
          
        },
    child: Card(
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
              item.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Text(item.artist_id + "     ",
                    style: TextStyle(color: Colors.white)),
                Text(r"$" + item.price.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white)),
              ],
            ),
                trailing:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
          
          ),
    ));
  }

  Widget _cartHeader(BuildContext context, List<Artwork> _cartItems) {
    double total = 0.00;
    String roundedTotal;
    for (Artwork item in _cartItems) {
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
            _switchViewToDonatePage(context);
          },
        ),
      ],
    );
  }

  void _switchViewToDonatePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DonatePage(this)),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  // void addDonationToCart(ArtInfo cartItem) {
  //   _cartItems.add(cartItem);
  // }
}
