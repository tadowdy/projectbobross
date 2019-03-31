import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/DonatePage.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';
class CartPageBody extends StatefulWidget{
  @override
  _CartPageBody createState() => _CartPageBody();

}


class _CartPageBody extends State<CartPageBody> {
  @override
  Widget build(BuildContext context) {

      List _cartItems = getCartItems();
      debugPrint(_cartItems.toString());
    return Container(
      child: makeBody(context, _cartItems),
    );
  }

  Widget makeBody(BuildContext context, List<CartItemInfo> _cartItems) {
    return new Column(
      children: <Widget>[
        _cartHeader(context, _cartItems),
        _buildCartItems(_cartItems)
      ],
    );
  }

  Widget _buildCartItems(List<CartItemInfo> _cartItems) {
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
                      right: new BorderSide(width: 1.0, color: Colors.white))),
              child: new Image.network(item.url, height: 200, width: 100,),
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
                trailing:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0))),
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
            Navigator.push(context,
              MaterialPageRoute(
              builder: (__) => new DonatePage()

            )
            );
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

  // void addDonationToCart(ArtInfo cartItem) {
  //   _cartItems.add(cartItem);
  // }
}
