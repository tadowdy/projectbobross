import 'package:cloud_firestore/cloud_firestore.dart';


class Artwork{
  final String artist_id;
  //final String artwork_id;
  final String cart_id;
  final String description;
  final String exhibit_name;
  final String image_url;
  final String market_status;
  final int price;
  final String title;
  final String reveal_date;
  final DocumentReference reference;

  Artwork.fromMap(Map<String, dynamic> map, {this.reference})
    :assert(map['artist_id'] != null),
   // assert(map['artwork_id'] != null),
    assert(map['cart_id'] != null),
    assert(map['description'] != null),
    assert(map['exhibit_name'] != null),
    assert(map['image_URL'] != null),
    assert(map['market_status'] != null),
    assert(map['price'] != null),
    assert(map['title'] != null),
    assert(map['reveal_date'] != null),
    artist_id = map['artist_id'],
    //artwork_id = map['artwork_id'],
    cart_id = map['cart_id'],
    description = map['description'],
    exhibit_name = map['exhibit_name'],
    image_url = map['image_URL'],
    market_status = map['market_status'],
    price = map['price'],
    title = map['title'],
    reveal_date = map['reveal_date'];
  Artwork.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);
  @override
  String toString() => "ExhibitName<$artist_id:$cart_id:$description:$exhibit_name:$image_url:$market_status:$price:$title>";
  //$artwork_id:
}