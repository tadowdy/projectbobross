import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pbr/uiComponents.dart';

class ArtInfo {
  String artworkName;
  String artistName;
  double price;

  ArtInfo(String artworkName, String artistName, double price) {
    this.artworkName = artworkName;
    this.artistName = artistName;
    this.price = price;
  }
}

final _cartItems = <ArtInfo>[
  new ArtInfo("We are Number One", "Robbie Rotten", 1.11),
  new ArtInfo("I Was Number One", "Smitty Werbenjagermanjensen", 1.00),
   new ArtInfo("The One", "Neo", 10011.10),
];

class Cart extends StatefulWidget {
  Cart({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {
  Widget _buildCartItems(List<ArtInfo> _cartItems) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      itemCount: _cartItems.length,
      itemBuilder: (context, i) {
        return _itemRow(_cartItems[i]);
      },
    );
  }

  //TODO: ArtInfo will actually have to be CartItems as not every cart item will be art
  Widget _itemRow(ArtInfo art) {
    return InkWell(
        // make it clickable
        onTap: () {
          // new EventDetail(title: 'Event'); // create a event page if its clicked
        },
        child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                  child: Icon(Icons.image, color: Colors.white),
                ),
                title: Text(
                  art.artworkName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                subtitle: Row(
                  children: <Widget>[
                    Text(art.artistName + "     ",
                        style: TextStyle(color: Colors.white)),
                    Text(r"$" + art.price.toStringAsFixed(2),
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
              // ListTile(
              //   contentPadding:
              //       EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              //   title: Text("Artwork: " +
              //       art.artworkName +
              //       "\nArtist: " +
              //       art.artistName +
              //       "\n" +
              //       r"Price: $" +
              //       art.price.toStringAsFixed(2)),
              // ),
              ),
        ));

    // return ListTile(
    //   contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //   title: Text("Artwork: " +
    //       art.artworkName +
    //       "\nArtist: " +
    //       art.artistName +
    //       "\n" +
    //       r"Price: $" +
    //       art.price.toStringAsFixed(2)),
    // );
  }

  Widget _cartHeader(List<ArtInfo> _cartItems) {
    double total = 0;
    String roundedTotal;
    for (ArtInfo item in _cartItems) {
      total += item.price;
    }
    roundedTotal = total.toStringAsFixed(2);
    return new Row(
      children: <Widget>[
        new Container(width: 10.0),
        Text(
          "Current Total: " + r"$" + "$roundedTotal",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        new Container(width: 20.0),
        new RaisedButton(
          child: const Text("Donate to Jacoby Arts Center"),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DonatePage()),
            );
          },
        ),
      ],
    );
  }

  Widget cartBody(List<ArtInfo> _cartItems) {
    return new Column(
      children: <Widget>[_cartHeader(_cartItems), _buildCartItems(_cartItems)],
    );
  }

// TODO: again, Scaffold will have to be a container
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar,
      //TODO: ListView is does not scroll and breaks off page when more items are in the list
      //     this affects adding donations to the list
      body: cartBody(_cartItems),
    );
  }
}

//TODO: can't return a scaffold, will need to be refactored to container
class DonatePage extends StatelessWidget {
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
                _cartItems.add(new ArtInfo("Donation", "for Jacoby Arts Center", 10.00));
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
