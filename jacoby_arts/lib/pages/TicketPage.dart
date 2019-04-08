import 'package:flutter/material.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:intl/intl.dart';
import 'package:jacoby_arts/auxiliary/CartClasses.dart';

class TicketPage extends StatefulWidget {
  var eventData;
  TicketPage({this.eventData});
  @override
  _TicketPage createState() => _TicketPage(eventData: eventData);
  
}


//List<String> allDropdownValues = new List<String>();
class _TicketPage extends State<TicketPage>{
  String dropdownValue = '1';
  int maxNumberOfTickets = 10;
  //var ddlist = makeList(maxNumberOfTickets);
  var eventData;
  _TicketPage({this.eventData});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar ,
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
                  onChanged: (String newValue){
                    setState((){
                      dropdownValue = newValue;
                    });
                  },

                  items: makeList(maxNumberOfTickets).map<DropdownMenuItem<String>>((String value){
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
                      int cartPrice = int.parse(dropdownValue) * eventData.price;
                      CartItemInfo eventItem = new CartItemInfo(eventData.title, "Ticket (" + dropdownValue + ")", cartPrice, " ");
                      addCartItem(eventItem);
                    },
                    child: Text('Add to cart'),
                  ),
                )

              ],
            )
          ],
        ),
      ),);
  }
}
makeList(int maxNumberOfTicket){
  List<String> allDropdownValues = new List<String>();
  for(int i = 0; i <= maxNumberOfTicket; i++){
    allDropdownValues.add(i.toString());
  }
  print(allDropdownValues);
  return allDropdownValues;
  
}