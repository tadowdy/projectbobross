import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/ArtworkDetailsPage.dart';
import 'package:jacoby_arts/widgets/ArtworkListPageBody.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Artist{
  final String artist_name;
  final DocumentReference reference;

  Artist.fromMap(Map<String,dynamic> map, {this.reference})
  :assert(map['name'] != null),
  artist_name = map['name'];

  Artist.fromSnapshot(DocumentSnapshot snapshot)
  :this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Artist<$artist_name>";
}

class Artwork{
  final String artist_id;
  //final String artwork_id;
  final String cart_id;
  final String description;
  final String exhibit_name;
  final String image_url;
  final String market_status;
  final int price;
  final String title;
  final DocumentReference reference;

  Artwork.fromMap(Map<String, dynamic> map, {this.reference})
    :assert(map['artist_id'] != null),
   // assert(map['artwork_id'] != null),
    assert(map['cart_id'] != null),
    assert(map['description'] != null),
    assert(map['exhibit_name'] != null),
    assert(map['image_URL'] != null),
    assert(map['market_status'] != null),
    assert(map['price'] != null),
    assert(map['title'] != null),
    artist_id = map['artist_id'],
    //artwork_id = map['artwork_id'],
    cart_id = map['cart_id'],
    description = map['description'],
    exhibit_name = map['exhibit_name'],
    image_url = map['image_URL'],
    market_status = map['market_status'],
    price = map['price'],
    title = map['title'];
  Artwork.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);
  @override
  String toString() => "ExhibitName<$artist_id:$cart_id:$description:$exhibit_name:$image_url:$market_status:$price:$title>";
  //$artwork_id:
}

const verticalTextPadding = 5.0;
// const horizontalTextPadding = 5.0;
// const verticalWidgetPadding = 15.0;

class ArtworkDetailsPage extends StatelessWidget {
  var artData;
  ArtworkDetailsPage({this.artData});
  void _addArtworkToCart(/*Artwork artwork, Cart cart*/) {
    // TODO: add the artwork to the cart.
    // TODO: notify the user whether the artwork was added to the cart using a popup.
  }

  void _submitArtworkFeedback(/*Text feedback*/) {
    // TODO: submit the feedback using a DAO.
    // TODO: notify the user whether the feedback was submitted using a popup.
  }

  @override
  Widget build(BuildContext context) {
    return detailsScaffold(context,artData);
  }
}

Scaffold detailsScaffold(context, artData) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(artData.title),
        backgroundColor: themeColor,
      ),
      body: Center(
        child: new SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new MyImageWidget(artData: artData),
              imageDetailsContainer(context,artData),
              artistInfoContainer(context,artData),
              priceInfoContainer(context,artData),
              descriptionHeader(context,artData),
              description(context,artData),
              // questionHeader(context),
              // questionBox(context),
              // questionSubmit(context),
            ],
          ),
        ),
      ));
}

class MyImageWidget extends StatelessWidget {
  var artData;
  MyImageWidget({this.artData});
  @override
  Widget build(BuildContext context) {
    
    // var assetsImage = new AssetImage(artData.image_url);
    // var image = new Image(
    //   image: new Image.network(_artwork.image_url, height: 75, width: 75,),
    //   width: imgWidth,
    //   height: imgHeight,
    // );
    return new Container(
      child: new Image.network(artData.image_url, height: 250, width: 150,),
      margin: EdgeInsets.symmetric(vertical: topPadding),
    );
  }
}

Container imageDetailsContainer(context, artData) {
  return Container(
    padding: const EdgeInsets.all(verticalTextPadding),
    child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(horizontalPadding),
            child: new Text('Name: ', style: headingTwoBold),
          ),
          new Container(
            padding: const EdgeInsets.all(horizontalPadding),
            child: new Text(
              artData.title,
              style: headingThree,
            ),
          ),
        ]),
  );
}

Container artistInfoContainer(context, artData) {
  return Container(
    padding: const EdgeInsets.all(verticalTextPadding),
    child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(horizontalPadding),
            child: new Text('Artist: ', style: headingTwoBold),
          ),
          new Container(
            padding: const EdgeInsets.all(horizontalPadding),
            child: new Text(
              artData.artist_id,
              style: headingThree,
            ),
          ),
        ]),
  );
}

Container priceInfoContainer(context, artData) {
  return Container(
      padding: const EdgeInsets.all(verticalTextPadding),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(horizontalPadding),
              child: new Text('Price: ', style: headingTwoBold),
            ),
            new Container(
              padding: const EdgeInsets.all(horizontalPadding),
              child: new Text(
                "\$" + artData.price.toString() + ".00",
                style: headingThree,
              ),
            ),
            purchaseContainer(context),
          ]));
}

Container purchaseContainer(context) {
  return Container(
    padding: const EdgeInsets.all(horizontalPadding),
    child: new SizedBox(
      width: largeButtonWidth,
      height: buttonHeight,
      child: new RaisedButton(
          onPressed: () {},
          color: Colors.amberAccent,
          splashColor: Colors.grey,
          disabledColor: Colors.red,
          elevation: 2.0,
          highlightElevation: 8.0,
          disabledElevation: 0.0,
          textColor: Colors.black,
          disabledTextColor: Colors.black,
          child: new Text(
            "Buy It!",
            style: new TextStyle(fontSize: buttonTextSize),
          )),
    ),
  );
}

Container descriptionHeader(context, artData) {
  return Container(
    padding: const EdgeInsets.only(
        top: verticalWidgetPadding,
        left: horizontalPadding,
        right: horizontalPadding),
    child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text('Description:', style: headingTwoBold),
        ]),
  );
}

Container description(context, artData) {
  return Container(
      padding: const EdgeInsets.only(
          top: verticalWidgetPadding,
          left: horizontalPadding,
          right: horizontalPadding),
      child: new Text(
        artData.description,
        style: contentText,
      ));
}

// Container questionHeader(context) {
//   return Container(
//     padding: const EdgeInsets.only(top: verticalWidgetPadding),
//     child: new Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         new Text('Questions about the piece? Ask Away!',
//             style: headingThreeBold),
//       ],
//     ),
//   );
// }

// Container questionBox(context) {
//   return Container(
//     padding: const EdgeInsets.only(
//         top: verticalWidgetPadding,
//         left: horizontalPadding,
//         right: horizontalPadding),
//     child: new TextField(
//       decoration: InputDecoration(
//           fillColor: Colors.grey, border: new OutlineInputBorder()),
//     ),
//   );
// }

// Row questionSubmit(context) {
//   return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         new RaisedButton(
//             onPressed: null,
//             splashColor: Colors.grey,
//             disabledColor: Colors.grey,
//             elevation: 2.0,
//             highlightElevation: 8.0,
//             disabledElevation: 0.0,
//             textColor: Colors.black,
//             disabledTextColor: Colors.black,
//             child: new Text("Submit")),
//       ]);
// }
