import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jacoby_arts/widgets/CartPageBody.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';

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
    return detailsScaffold(context, artData);
  }
}

Scaffold detailsScaffold(context, artData) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(artData.title),
        backgroundColor: themeColor,
      ),
      body: Center(
          child: Align(
        alignment: Alignment.topCenter,
        child: new SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new MyImageWidget(artData: artData),
              imageDetailsContainer(context, artData),
              artistInfoContainer(context, artData),
              priceInfoContainer(context, artData),
              descriptionHeader(context, artData),
              description(context, artData),
              // questionHeader(context),
              // questionBox(context),
              // questionSubmit(context),
            ],
          ),
        ),
      )));
}

class MyImageWidget extends StatelessWidget {
  var artData;
  MyImageWidget({this.artData});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Image.network(artData.image_url, fit: BoxFit.fill),
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

Widget marketStatus(context, artData) {
  if (artData.market_status == "For Sale") {
    return Text(
      "\$" + artData.price.toString() + ".00",
      style: headingThree,
    );
  } else if (artData.market_status == "Not For Sale") {
    return Text(
      "Not For Sale",
      style: headingThree,
    );
  } else {
    return Text(
      "Sold",
      style: headingThree,
    );
  }
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
              child: marketStatus(context, artData)
            ),
            artData.market_status == 'For Sale' ? purchaseContainer(context, artData) : emptyContainer() 
          ]
          )
          );
}

Container emptyContainer() {
  return Container();
}

Container purchaseContainer(context, artData) {
  return Container(
    padding: const EdgeInsets.all(horizontalPadding),
    child: new SizedBox(
      width: largeButtonWidth,
      height: buttonHeight,
      child: new RaisedButton(
          onPressed: () {
            CartItemInfo item = new CartItemInfo(artData.title,
                artData.artist_id, artData.price, artData.image_url);
            addCartItem(item);
          },
          color: Colors.amberAccent,
          splashColor: Colors.grey,
          disabledColor: Colors.red,
          elevation: 2.0,
          highlightElevation: 8.0,
          disabledElevation: 0.0,
          textColor: Colors.black,
          disabledTextColor: Colors.black,
          child: new Text(
            "Add to cart",
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
