import 'package:flutter/material.dart';
import 'package:pbr/Pages/ArtworkDetailsPage.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';

class ArtworkListPageBody extends StatelessWidget {
  ArtworkListPageBody();

  void _updateArtworkList() {
    // TODO: update the list of artwork using a DAO.
  }

  void _switchViewToArtworkDetails(/*Artwork artwork*/) {
    // TODO: create new ArtworkDetailsPage w. artwork..
    // TODO: build and push the ArtworkDetailsPage onto the nav stack..
  }

  @override
  Widget build(BuildContext context) {
    return makeBody;
  }
}

final makeBody = Container(
  margin: EdgeInsets.only(
      top: topPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    ),
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(context); // make a card for the list
        }
    )
);

InkWell makeCard(context) {
  return new InkWell( // make it clickable
      onTap: () {
        // create a event page if its clicked
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new ArtworkDetailsPage()));
      },
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: cardPadding),
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: makeListTile,
        ),
      )
  );
}

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration( // create a inset for the image
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white))),
      child: Icon(Icons.image, color: Colors.white),
    ),
    title: Text(
      "Art Name",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Text(" Artist", style: TextStyle(color: Colors.white)),
        Text(" Price", style: TextStyle(color: Colors.white)),

      ],
    ),

    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
);
