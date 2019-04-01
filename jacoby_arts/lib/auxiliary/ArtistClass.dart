import 'package:cloud_firestore/cloud_firestore.dart';

class Artist{
  final String artist_name;
  final DocumentReference reference;

  Artist.fromMap(Map<String,dynamic> map, {this.reference})
  :assert(map['name'] != null),
  artist_name = map['name'];

  Artist.fromSnapshot(DocumentSnapshot snapshot)
  :this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Artist<$artist_name>";
}