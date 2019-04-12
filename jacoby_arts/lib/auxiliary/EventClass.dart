import 'package:cloud_firestore/cloud_firestore.dart';

class Events{
  final String title;
  final int tickets_sold;
  final String reveal_date;
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
      assert(map['reveal_date'] != null),
      assert(map['tickets_sold'] != null),
      assert(map['title'] != null),
      capacity = map['capacity'],
      date = map['date'],
      description = map['description'],
      image_url = map['image_URL'],
      location = map['location'],
      reveal_date = map['reveal_date'],
      price = map['price'],
      tickets_sold = map['tickets_sold'],
      title = map['title'];
  
  Events.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => 
  'Events<$capacity:$description:$date:$image_url:$location:$price:$reveal_date:$tickets_sold:$title>';

}

getEventData(eventData){
Firestore.instance.runTransaction((transaction) async {
    // var record = Firestore.instance.collection('Events').reference(docID)
    final freshSnapshot = await transaction.get(eventData.reference);
    final fresh = Events.fromSnapshot(freshSnapshot);
    await transaction;
    eventData = fresh;
  });
}