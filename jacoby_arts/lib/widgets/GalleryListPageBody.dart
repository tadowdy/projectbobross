import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/ArtworkDetailsPage.dart';
import 'package:jacoby_arts/widgets/ArtworkListPageBody.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';





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

class Artwork{
  final String artist_id;
  final String artwork_id;
  final String cart_id;
  final String description;
  final String exhibit_name;
  final String image_url;
  final String market_status;
  final int price;
  final String title;
  final DocumentReference reference;

  Artwork.fromMap(Map<String, dynamic> map, {this.reference})
    :assert(map['artist_id'] != null),
    assert(map['artwork_id'] != null),
    assert(map['cart_id'] != null),
    assert(map['description'] != null),
    assert(map['exhibit_name'] != null),
    assert(map['image_url'] != null),
    assert(map['market_status'] != null),
    assert(map['price'] != null),
    assert(map['title'] != null),
    artist_id = map['artist_id'],
    artwork_id = map['artwork_id'],
    cart_id = map['cart_id'],
    description = map['description'],
    exhibit_name = map['exhibit_name'],
    image_url = map['image_url'],
    market_status = map['market_status'],
    price = map['price'],
    title = map['title'];
  Artwork.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);
  @override
  String toString() => "ExhibitName<$artwork_id:$artist_id:$cart_id:$description:$exhibit_name:$image_url:$market_status:$price:$title>";
}

class GalleryListPageBody extends StatelessWidget {
  GalleryListPageBody();

  @override
  Widget build(BuildContext context) {   
    return getData(context);
  }
}
getData(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('Artwork').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return LinearProgressIndicator();
      return makeBody(context, snapshot.data.documents);
    }
    
  );
}
makeBody(BuildContext context,List<DocumentSnapshot> snapshot){

  return Container(
    margin: EdgeInsets.only(
      top: topPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    ),
    child: _listView(context,snapshot)
    
  );
}
_listView(BuildContext context, List<DocumentSnapshot> snapshot){
return ListView(
  padding: const EdgeInsets.only(top: 20.0),
  children: snapshot.map((data) => makeCard(context,data)).toList(),
);
}
getArtist(String ref){

  Stream<DocumentSnapshot> x = Firestore.instance.collection('Artists')
  .document(ref).snapshots();
  if (x != null){
    print('has data');
    return x.map((data) => dataa(data)).toList();
    
  }
  else{
    print('nope');
  }

}
var _artist;
dataa(DocumentSnapshot data){
  print('in dataa');
_artist = Artist.fromSnapshot(data);
//print(_artist.artist_name);
}

InkWell makeCard(BuildContext context, DocumentSnapshot data){
  final _artwork =  Artwork.fromSnapshot(data);
  
 
  return new InkWell(
      // make it clickable
      onTap: () {
        // create a event page if its clicked
        Navigator.push(context,
        MaterialPageRoute(
            builder: (__) => new ArtworkDetailsPage(artData: _artwork)

          )
          );
      },
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: cardPadding),
        child: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                 // create a inset for the image
                border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white))),
                child: Icon(Icons.image, color: Colors.white),
            ),
              title: Text(
                _artwork.title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  
                  Text('_artist', style: TextStyle(color: Colors.white)),
                  Text(_artwork.price.toString(), style: TextStyle(color: Colors.white)),
                ],
              ),
              trailing:
                Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
        ),
  ));
}
