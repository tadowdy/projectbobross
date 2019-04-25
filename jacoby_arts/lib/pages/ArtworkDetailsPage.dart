import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';

const verticalTextPadding = 5.0;

class ArtworkDetailsPage extends StatelessWidget {
  var artData;

  ArtworkDetailsPage({this.artData});

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
              imageDetailsContainer(
                context,
                artData,
              ),
              artistInfoContainer(
                context,
                artData,
              ),
              priceInfoContainer(
                context,
                artData,
              ),
              descriptionHeader(
                context,
                artData,
              ),
              description(
                context,
                artData,
              ),
              Divider(
                color: const Color(0xFAFAFA),
                height: 48,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyImageWidget extends StatelessWidget {
  var artData;

  MyImageWidget({this.artData});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Image.network(
        artData.imageURL,
        fit: BoxFit.fill,
      ),
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
          child: new Text(
            'Name: ',
            style: headingTwoBold,
          ),
        ),
        new Container(
          padding: const EdgeInsets.all(horizontalPadding),
          child: new Text(
            artData.title,
            style: headingThree,
          ),
        ),
      ],
    ),
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
          child: new Text(
            'Artist: ',
            style: headingTwoBold,
          ),
        ),
        new Container(
          padding: const EdgeInsets.all(horizontalPadding),
          child: new Text(
            artData.artistId,
            style: headingThree,
          ),
        ),
      ],
    ),
  );
}

Widget marketStatus(context, artData) {
  var displayText = "Not For Sale";

  if (artData.marketStatus == "For Sale") {
    displayText = "\$" + artData.price.toString() + ".00";
  } else if (artData.marketStatus == "Sold") {
    displayText = "Sold";
  }

  return Text(
    displayText,
    style: headingThree,
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
          child: new Text(
            'Price: ',
            style: headingTwoBold,
          ),
        ),
        new Container(
          padding: const EdgeInsets.all(horizontalPadding),
          child: marketStatus(
            context,
            artData,
          ),
        ),
//// THE FOLLOWING PAGE IS NOT COMPLETE, HIDE IT BUT DO NOT REMOVE IT
//        artData.marketStatus == 'For Sale'
//            ? purchaseContainer(
//                context,
//                artData,
//              )
//            : emptyContainer()
      ],
    ),
  );
}

Container emptyContainer() {
  return Container();
}

Container purchaseContainer(context, artData) {
  return Container(
    padding: const EdgeInsets.all(horizontalPadding),
    child: new SizedBox(
      width: 150,
      height: buttonHeight,
      child: new RaisedButton(
        onPressed: () {
          CartItemInfo item = new CartItemInfo(
            artData.title,
            artData.artistId,
            artData.price,
            artData.imageURL,
          );
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
          "Add to Cart",
          style: new TextStyle(fontSize: buttonTextSize),
        ),
      ),
    ),
  );
}

Container descriptionHeader(context, artData) {
  return Container(
    padding: const EdgeInsets.only(
      top: verticalWidgetPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    ),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Text(
          'Description:',
          style: headingTwoBold,
        ),
      ],
    ),
  );
}

Container description(context, artData) {
  return Container(
    padding: const EdgeInsets.only(
      top: verticalWidgetPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    ),
    child: new Text(
      artData.description,
      style: contentText,
    ),
  );
}
