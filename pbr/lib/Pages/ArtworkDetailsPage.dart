import 'package:flutter/material.dart';

const verticalTextPadding = 5.0;
const horizontalTextPadding = 5.0;
const verticalWidgetPadding = 15.0;

class ArtworkDetailsPage extends StatelessWidget {

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
    return Scaffold(
      appBar: new AppBar(
          title: new Text('Sunflowers')
      ),
      body: Center(
        child: new SingleChildScrollView(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new MyImageWidget(),
                new Container(
                  padding: const EdgeInsets.all(verticalTextPadding),
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new Text('Name: ',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold)
                          ),
                        ),
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new Text('Sunflowers'),
                        ),
                      ]
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(verticalTextPadding),
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new Text('Artist: ',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold)
                          ),
                        ),
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new Text('Vincent Van Gogh'),
                        ),
                      ]
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(verticalTextPadding),
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new Text('Price: ',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold)
                          ),
                        ),
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new Text('Priceless'),
                        ),
                        new Container(
                          padding: const EdgeInsets.all(horizontalTextPadding),
                          child: new SizedBox(
                            width: 100.0,
                            height: 20.0,
                            child: new RaisedButton(onPressed: () {},
                                color: Colors.yellow,
                                splashColor: Colors.grey,
                                disabledColor: Colors.red,
                                elevation: 2.0,
                                highlightElevation: 8.0,
                                disabledElevation: 0.0,
                                textColor: Colors.black,
                                disabledTextColor: Colors.black,
                                child: new Text("Buy It!")),
                          ),
                        ),
                      ]
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: verticalWidgetPadding),
                  child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Text('Description:',
                            style: new TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ]
                  ),
                ),
                new Container(
                    child: new Text(
                        '''This is a famous painting by Vincent Van Gogh which can be viewed at the Van Gogh museum in Amsterdam, Netherlands. Van Gogh is a artist from the late 17th century. He was born in the Netherlands''')
                ),
                new Container(
                  padding: const EdgeInsets.only(top: verticalWidgetPadding),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text('Questions about the piece? Ask Away!',
                          style: new TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: new OutlineInputBorder()
                    ),
                  ),
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(onPressed: null,
                          color: Colors.greenAccent,
                          splashColor: Colors.grey,
                          disabledColor: Colors.grey,
                          elevation: 2.0,
                          highlightElevation: 8.0,
                          disabledElevation: 0.0,
                          textColor: Colors.black,
                          disabledTextColor: Colors.black,
                          child: new Text("Submit")),
                    ]
                )
              ]
          ),
        ),
      ),
    );
  }
}

class MyImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/sunflowers.jpg');
    var image = new Image(image: assetsImage, width: 200.0, height: 200.0);
    return new Container(child: image);
  }
}