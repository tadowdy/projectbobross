import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatelessWidget {
  var eventData;
  EventDetailsPage({ this.eventData});
  void _addEventToCart(/*Event event*/) {
    // TODO: add the event to the cart.
    // TODO: notify the user whether the event was added to the cart using a popup.
  }

  void _signUpForEvent(/*Event event*/) {
    // TODO: sign up the user for the event.
    // TODO: notify the user whether the event sign up was successful using a popup.
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context,eventData);
  }
}

buildBody(BuildContext context, eventData){

    var time = eventData.date.replaceAll(new RegExp(r'-'),'');
    var time1 = time.replaceAll(new RegExp(r':'),'');
    var time2 = time1.substring(0,15);
    DateTime date = DateTime.parse(time2);
    var final_date = new DateFormat.yMMMd().format(date);
    var final_time = new DateFormat.jm().format(date);
    // var intEventPrice = eventData.price.toString();
    // intEventPrice = intEventPrice.substring(0,intEventPrice.length-2);
    final eventPrice = Container(
    padding: const EdgeInsets.all(7.0),
    decoration: new BoxDecoration(
      border: new Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15.0)),
      child: new Text(
        "\$" + eventData.price.toString() + ".00",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );

    final topContentText = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      
      Container(
        width: 120.0,
        
        child: new Divider(color:Colors.yellow),
      ),
      SizedBox(height: 10.0),
      Text(
        eventData.title,
        style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Expanded(flex: 1, child: levelIndicator),
          Expanded(
            flex: 6,
            child: Padding(
              padding:EdgeInsets.only(left: 10.0),
              child: Text(
                final_date+"  "+final_time.toString(),
                style: TextStyle(color: Colors.white),
              )
            )
          ),
          Expanded(flex: 2, child: eventPrice)
        ],
      ),
    ],
  );
  
  final topContent = Stack(
  children: <Widget>[
    Container(
      padding: EdgeInsets.only(left:10.0),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/lobby.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      ),
    Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(40.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color.fromRGBO(58,66,86,.7)),
      child: Center(
        child: topContentText,
    ),
    ),
    Positioned(
      left:8.0,
      top: 60.0,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
      )
    )
  ],);

  
    final bottomContentText = Text(
      eventData.description,
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child:  RaisedButton(
        onPressed: () => {},
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child:
          Text("BUY TICKETS", style: TextStyle(color: Colors.white)),
      )
    );

    final bottomContent = Container(
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText,readButton],
        ),
      ),
    );


  return new Scaffold(
          appBar: new AppBar(
          title: new Text(eventData.title)
          ),
    body: Column(
      children: <Widget>[topContent, bottomContent]
    ),
  );

addTimeDate(BuildContext context, eventData){
  var time = eventData.date.replaceAll(new RegExp(r'-'), '');
  var time1 = time.replaceAll(new RegExp(r':'), '');
  var time2 = time1.substring(0,15);
  DateTime date = DateTime.parse(time2);
  final _date = new DateFormat.yMMMd().format(date);
  final _time = new DateFormat.jm().format(date);
  return new SingleChildScrollView(
  child: new Container(
    margin: const EdgeInsets.only(
        top: topPadding, left: horizontalPadding, right: horizontalPadding, bottom: verticalWidgetPadding),
    child: new Row(
      children: <Widget>[
        
        new Column(children: <Widget>[
        new Text(eventData.location, style: headingOne),
        new Text(

          eventData.date,
          style: headingOne,
        ),
        ],
        ),
        
      ],
    ),
  ),
);
}
addDescription(BuildContext context, eventData){

   return new SingleChildScrollView(
    child: new Container(
        margin: const EdgeInsets.only(
            top: verticalWidgetPadding * 3.0,
            left: horizontalPadding,
            right: horizontalPadding),
        child: new Column(children: <Widget>[
          new Text(eventData.price.toString(), style: headingTwo),
          new Text(
            "Description",
            style: headingTwo,
          ),
          new Text(
            eventData.description,
            style: contentText,
          ),
          ButtonTheme(
            minWidth: largeButtonWidth,
            height: buttonHeight,
            child: RaisedButton(
              onPressed: () {
                // add event to cart
              },
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: horizontalPadding, left: horizontalPadding),
                    child: Text(
                      'Buy Tickets',
                      style: headingThree,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ])));
}


}