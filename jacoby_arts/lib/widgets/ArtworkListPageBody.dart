import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/ArtworkDetailsPage.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jacoby_arts/auxiliary/CompareDates.dart';

class ArtworkListPageBody extends StatelessWidget {
  ArtworkListPageBody();

  @override
  Widget build(BuildContext context) {
    return getData(context);
  }
}

getData(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('Artwork').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      return makeBody(context, snapshot.data.documents);
    },
  );
}

makeBody(BuildContext context, List<DocumentSnapshot> snapshot) {
  return Container(
    margin: EdgeInsets.only(
      top: topPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    ),
    child: _listView(
      context,
      snapshot,
    ),
  );
}

_listView(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => makeCard(context, data)).toList(),
  );
}

Widget marketStatus(context, _artwork) {
  if (_artwork.marketStatus == "For Sale") {
    return Text(
      "\$" + _artwork.price.toString() + ".00",
      style: TextStyle(color: Colors.white),
    );
  } else if (_artwork.marketStatus == "Not For Sale") {
    return Text(
      "Not For Sale",
      style: TextStyle(color: Colors.white),
    );
  } else {
    return Text(
      "Sold",
      style: TextStyle(color: Colors.white),
    );
  }
}

var i = 0;
InkWell makeCard(BuildContext context, DocumentSnapshot data) {
  final _artwork = Artwork.fromSnapshot(data);
  final _artist = _artwork.artistId;

  bool visible = compareDate(_artwork.revealDate);

  return new InkWell(
    // make it clickable
    onTap: () {
      // create an event page if its clicked
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (__) => new ArtworkDetailsPage(artData: _artwork),
        ),
      );
    },
    child: Visibility(
      visible: visible,
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: cardPadding,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                // create a inset for the image
                border: new Border(
                  right: new BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
              child: new Image.network(_artwork.imageURL),
            ),
            title: Text(
              _artwork.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _artist,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                marketStatus(context, _artwork),
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ),
    ),
  );
}
