import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:intl/intl.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';
import 'package:jacoby_arts/auxiliary/EventClass.dart';

class TicketPage extends StatefulWidget {
  var eventData;
  TicketPage({this.eventData});
  @override
  _TicketPage createState() => new _TicketPage(eventData: eventData);
}

//List<String> allDropdownValues = new List<String>();
class _TicketPage extends State<TicketPage> {
  String dropdownValue = '1';
  //var ddlist = makeList(maxNumberOfTickets);
  Events eventData;
  _TicketPage({this.eventData});
  //int maxNumberOfTickets = eventData.capacity;
    update() {
      setState(() {
        Firestore.instance.runTransaction((transaction) async {
          final DocumentSnapshot freshSnapshot = await transaction.get(eventData.reference);
          final fresh = Events.fromSnapshot(freshSnapshot);
          await transaction.update(eventData.reference,
              {'tickets_sold': fresh.tickets_sold + int.parse(dropdownValue)});
          final newfresh = Events.fromSnapshot(freshSnapshot);
          print("new" + newfresh.tickets_sold.toString());
          print("SS" + eventData.tickets_sold.toString());
          //remainingCapacity = getRemainingCapacity(newfresh);
        });
      });
    }
  Widget build(BuildContext context) {
    var remainingCapacity = getRemainingCapacity(eventData);

    print(eventData.tickets_sold);
    //eventData = getEventData(eventData);
    return Scaffold(
      appBar: topAppBar,
      body: Center(
        child: Column(
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Number of tickets:',
                  style: new TextStyle(
                      fontSize: headingOneSize,
                      color: const Color(0xFF080808),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: makeList(remainingCapacity)
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ButtonTheme(
                  minWidth: medButtonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    onPressed: () {
                      int cartPrice =
                          int.parse(dropdownValue) * eventData.price;
                      CartItemInfo eventItem = new CartItemInfo(
                          eventData.title,
                          "Ticket (" + dropdownValue + ")",
                          cartPrice,
                          eventData.image_url);
                      addCartItem(eventItem);
                      update();
                    },
                    child: Text('Add to cart'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

makeList(int maxNumberOfTicket) {
  List<String> allDropdownValues = new List<String>();
  for (int i = 0; i <= maxNumberOfTicket; i++) {
    allDropdownValues.add(i.toString());
  }
  return allDropdownValues;
}

getRemainingCapacity(eventData) {
  int remainingCapacity = eventData.capacity - eventData.tickets_sold;

  return remainingCapacity;
}
