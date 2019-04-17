import 'package:cloud_firestore/cloud_firestore.dart';

class Artwork {
  final String artistId;
  //final String artwork_id;
  final String cartId;
  final String description;
  final String exhibitName;
  final String imageURL;
  final String marketStatus;
  final int price;
  final String title;
  final String revealDate;
  final DocumentReference reference;

  Artwork.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['artist_id'] != null),
        //assert(map['artwork_id'] != null),
        assert(map['cart_id'] != null),
        assert(map['description'] != null),
        assert(map['exhibit_name'] != null),
        assert(map['image_URL'] != null),
        assert(map['market_status'] != null),
        assert(map['price'] != null),
        assert(map['title'] != null),
        assert(map['reveal_date'] != null),
        artistId = map['artist_id'],
        //artwork_id = map['artwork_id'],
        cartId = map['cart_id'],
        description = map['description'],
        exhibitName = map['exhibit_name'],
        imageURL = map['image_URL'],
        marketStatus = map['market_status'],
        price = map['price'],
        title = map['title'],
        revealDate = map['reveal_date'];

  Artwork.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data,
          reference: snapshot.reference,
        );

  @override
  String toString() =>
      "ExhibitName<$artistId:$cartId:$description:$exhibitName:$imageURL:$marketStatus:$price:$title>";
  //$artwork_id:
}
