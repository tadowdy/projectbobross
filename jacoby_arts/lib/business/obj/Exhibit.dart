// Author       : Logan Waldron
// Date Created : 11/01/18
// Last Modified: 11/01/18
// About        : A class used to represent an exhibit at JAC

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Firestore db = Firestore.instance;
CollectionReference exhibitCollectionRef = db.collection('Exhibits');

Stream<QuerySnapshot> getExhibitList({int offset, int limit}){
  Stream<QuerySnapshot> snapshots = exhibitCollectionRef.snapshots();

  if(offset != null){
    snapshots = snapshots.skip(offset);
  }
  if(limit != null){
    snapshots = snapshots.take(limit);
  }
  return snapshots;
}



class Exhibit {

  int _exhibitId;

  String _name;

  DocumentReference reference;

  //String _imageURL;

  /*CONSTRUCTORS****/
  Exhibit();

  Exhibit.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['Exhibits'] != null),
      _name = map['Exhibits'];

  Exhibit.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => 'Exhibits<$_name>';


  // /*SETTERS****/
  // void setExhibitId(int exhibitId) {
  //   _exhibitId = (exhibitId >= 0) ? exhibitId : 0;
  // }

  // void setName(String name) {
  //   _name = (name == null) ? "" : name;
  // }

  // // void setImage(Image image) {
  // //   _image = image;
  // // }

  /*GETTERS****/
  int getExhibitId() {
    return _exhibitId;
  }

  getName() async {
    return Firestore.instance.collection('Exhibits').getDocuments();
  }

  // String getImage() {
  //   return _imageURL;
  // }

  /*UTILITY****/

}
