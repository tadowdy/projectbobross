import 'package:flutter/material.dart';
import 'package:jacoby_arts/Pages/DonatePage.dart';
import 'package:jacoby_arts/Auxiliary/CartClasses.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';

List _cartItems = <ArtInfo>[];

class CartPageBody extends StatelessWidget {
  var artData;
  CartPageBody({this.artData});
  
  

  @override
  Widget build(BuildContext context) {
    debugPrint(artData.title);
    ArtInfo test = new ArtInfo(artData.title, artData.artist_id, artData.price,artData.image_url);
    _cartItems.add(test);
    return Container(
      child: makeBody(context, _cartItems),
    );
  }

  Widget makeBody(BuildContext context, List<ArtInfo> _cartItems) {
    return new Column(
      children: <Widget>[
        _cartHeader(context, _cartItems),
        _buildCartItems(_cartItems)
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

  void addDonationToCart(ArtInfo cartItem) {
    _cartItems.add(cartItem);
  }
}
