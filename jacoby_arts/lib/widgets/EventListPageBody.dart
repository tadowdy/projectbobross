import 'package:flutter/material.dart';
import 'package:jacoby_arts/Pages/EventDetailsPage.dart';
import 'package:jacoby_arts/auxiliary/uiComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Events{
  final String title;
  final double price;
  final String location;
  final String image_url;
  final String description;
  final String date;
  final double capacity;
  final DocumentReference reference;

  Events.fromMap(Map<String,dynamic> map, {this.reference})
    :assert(map['capacity'] != null),
      assert(map['date'] != null),
      assert(map['description'] != null),
      assert(map['image_URL'] != null),
      assert(map['location'] != null),
      assert(map['price'] != null),
      assert(map['title'] != null),
      capacity = map['capacity'],
      date = map['date'],
      description = map['description'],
      image_url = map['image_URL'],
      location = map['location'],
      price = map['price'],
      title = map['title'];
  
  Events.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => 
  'Events<$capacity:$description:$date:$image_url:$location:$price:$title>';

}

class EventListPageBody extends StatelessWidget {
  EventListPageBody();

  @override
  Widget build(BuildContext context) {
    return getData(context);
  }
}
getData(BuildContext context){
  return StreamBuilder(
    stream: Firestore.instance.collection('Events').snapshots(),
    builder: (context, snapshot){
      if(!snapshot.hasData) return LinearProgressIndicator();
      return makeBody(context, snapshot.data.documents);
    },
  );
}
makeBody(BuildContext context, List<DocumentSnapshot> snapshot){
  return Container(
    child: ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => makeCard(context,data)).toList(),
    ),
    
    // ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemBuilder: (BuildContext context, int index) {
    //     return makeCard(context); // make a card for the list
    //   }
    // )
  );
}
InkWell makeCard(BuildContext context, DocumentSnapshot data){
  final eventData = Events.fromSnapshot(data);
  // DateTime eventDate = eventData.date;
  // String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(eventDate);

  return new InkWell( // make it clickable
  onTap: (){
    Navigator.push(context,
    MaterialPageRoute(
      builder: (context) => new Scaffold(
        appBar: new AppBar(
          title: new Text(eventData.title)
        ),
        body: new EventDetailsPage(), // go to new page
      )
    )); // create a event page if its clicked
  },
  child: Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration( // create a inset for the image
            border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.white))),
            child: Icon(Icons.image, color: Colors.white),
        ),
          title: Text(
            eventData.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          subtitle: Row(
            children: <Widget>[
              Text(eventData.date, style: TextStyle(color: Colors.white)),
              Text(' \$' + eventData.price.toString(), style: TextStyle(color: Colors.white)),
            ],
          ),
          trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
      ),
    ),
  )
  );
}

// final makeListTile = ListTile(
//   contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//   leading: Container(
//     padding: EdgeInsets.only(right: 12.0),
//     decoration: new BoxDecoration( // create a inset for the image
//         border: new Border(
//             right: new BorderSide(width: 1.0, color: Colors.white))),
//     child: Icon(Icons.image, color: Colors.white),
//   ),
//   title: Text(
//     "Class Name",
//     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//   ),
//   // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

//   subtitle: Row(
//     children: <Widget>[
//       Text(" Date/Time", style: TextStyle(color: Colors.white)),
//       Text(" Price", style: TextStyle(color: Colors.white)),

//     ],
//   ),
  
//   trailing:
//       Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
//   );

