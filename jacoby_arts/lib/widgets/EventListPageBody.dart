import 'package:flutter/material.dart';
import 'package:jacoby_arts/Pages/EventDetailsPage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Events{
  final String title;
  final int price;
  final String location;
  final String image_url;
  final String description;
  final String date;
  final int capacity;
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
  var time = eventData.date.replaceAll(new RegExp(r'-'), '');
  var time1 = time.replaceAll(new RegExp(r':'), '');
  var time2 = time1.substring(0,15);
  DateTime date = DateTime.parse(time2);
  final _date = new DateFormat.yMMMd().format(date);
  final _time = new DateFormat.jm().format(date);
  var _imageUrl = eventData.image_url;
  

  return new InkWell( // make it clickable
  onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (__) =>new EventDetailsPage(eventData: eventData)

    )
    ); // create a event page if its clicked
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
            child: new Image.network(_imageUrl, height: 75, width: 75,),
        ),
          title: Text(
            eventData.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          subtitle: Row(
            children: <Widget>[
              Text(_date + " " + _time , style: TextStyle(color: Colors.white)),
              Text(' \$' + eventData.price.toString()+ ".00", style: TextStyle(color: Colors.white)),
            ],
          ),
          trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
      ),
    ),
  )
  );
}


