import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jacoby_arts/pages/TicketPage.dart';

class EventDetailsPage extends StatelessWidget {
  var eventData;

  EventDetailsPage({this.eventData});

  @override
  Widget build(BuildContext context) {
    return buildBody(context, eventData);
  }
}

buildBody(BuildContext context, eventData) {
  var time = eventData.date.replaceAll(new RegExp(r'-'), '');
  var time1 = time.replaceAll(new RegExp(r':'), '');
  var time2 = time1.substring(0, 15);
  DateTime date = DateTime.parse(time2);
  var finalDate = new DateFormat.yMMMd().format(date);
  var finalTime = new DateFormat.jm().format(date);
  final eventPrice = Container(
    padding: const EdgeInsets.all(7.0),
    decoration: new BoxDecoration(
      border: new Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15.0),
    ),
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
        child: new Divider(color: Colors.yellow),
      ),
      SizedBox(height: 10.0),
      Text(
        eventData.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                finalDate + "  " + finalTime.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: eventPrice,
          ),
        ],
      ),
    ],
  );

  final topContent = Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 10.0),
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('images/lobby.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.6,
        padding: EdgeInsets.all(40.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromRGBO(58, 66, 86, .7),
        ),
        child: Center(
          child: topContentText,
        ),
      ),
      Positioned(
        left: 8.0,
        top: 60.0,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    ],
  );

  final bottomContentText = Text(
    eventData.description,
    style: TextStyle(fontSize: 18.0),
  );

  final readButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: RaisedButton(
      onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (__) => new TicketPage(eventData: eventData),
              ),
            ),
          },
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Text(
        "BUY TICKETS",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );

  final bottomContent = Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(40.0),
    child: Center(
      child: Column(
        children: <Widget>[
          bottomContentText,
          readButton,
        ],
      ),
    ),
  );

  return new Scaffold(
    appBar: new AppBar(
      title: new Text(eventData.title),
    ),
    body: ListView(
      children: <Widget>[
        topContent,
        bottomContent,
      ],
    ),
  );
}
