import 'package:flutter/material.dart';
import 'package:pbr/BodyWidgets/ArtworkListPageBody.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';

class GalleryListPageBody extends StatelessWidget {
  GalleryListPageBody();

  @override
  Widget build(BuildContext context) {
    return makeBody;
  }
}

final makeBody = Container(
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(context); // make a card for the list
        }));

InkWell makeCard(context) {
  return new InkWell(
      // make it clickable
      onTap: () {
        // create a event page if its clicked
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new Scaffold(
                    appBar: new AppBar(
                      title: new Text('Gallery Title'),
                      backgroundColor: themeColor,
                    ),
                    body: new ArtworkListPageBody())));
      },
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: makeListTile,
        ),
      ));
}

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          // create a inset for the image
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white))),
      child: Icon(Icons.image, color: Colors.white),
    ),
    title: Text(
      "Gallery Name",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
