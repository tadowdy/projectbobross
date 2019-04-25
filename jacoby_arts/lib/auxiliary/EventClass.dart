import 'package:cloud_firestore/cloud_firestore.dart';

class Events {
  final String title;
  final String revealDate;
  final int price;
  final String location;
  final String imageURL;
  final String description;
  final String date;
  final int capacity;
  final DocumentReference reference;

  Events.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['capacity'] != null),
        assert(map['date'] != null),
        assert(map['description'] != null),
        assert(map['image_URL'] != null),
        assert(map['location'] != null),
        assert(map['price'] != null),
        assert(map['reveal_date'] != null),
        assert(map['title'] != null),
        capacity = map['capacity'],
        date = map['date'],
        description = map['description'],
        imageURL = map['image_URL'],
        location = map['location'],
        revealDate = map['reveal_date'],
        price = map['price'],
        title = map['title'];

  Events.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data,
          reference: snapshot.reference,
        );

  @override
  String toString() =>
      'Events<$capacity:$description:$date:$imageURL:$location:$price:$revealDate:$title>';
}
