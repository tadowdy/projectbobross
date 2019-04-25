import 'package:cloud_firestore/cloud_firestore.dart';

class Artist {
  final String artistName;
  final DocumentReference reference;

  Artist.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        artistName = map['name'];

  Artist.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data,
          reference: snapshot.reference,
        );

  @override
  String toString() => "Artist<$artistName>";
}
