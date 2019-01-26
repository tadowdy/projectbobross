import 'package:flutter/material.dart';
import 'package:jacoby_arts/widgets/ArtworkListPageBody.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





class ExhibitName{
  final String name;
  final DocumentReference reference;

  ExhibitName.fromMap(Map<String, dynamic> map, {this.reference})
    :assert(map['Name'] != null),
    name = map['Name'];
  ExhibitName.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);
  @override
  String toString() => "ExhibitName<$name>";
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
    stream: Firestore.instance.collection('Exhibits').snapshots(),
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
    
    // ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: true,
    //     itemBuilder: (BuildContext context, int index) {
    //       return makeCard(context,snapshot); // make a card for the list
    //     })
  );
}
_listView(BuildContext context, List<DocumentSnapshot> snapshot){
return ListView(
  padding: const EdgeInsets.only(top: 20.0),
  children: snapshot.map((data) => makeCard(context,data)).toList(),
);
}
InkWell makeCard(BuildContext context, DocumentSnapshot data) {
  final galleryName =  ExhibitName.fromSnapshot(data);
  return new InkWell(
      // make it clickable
      onTap: () {
        // create a event page if its clicked
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new Scaffold(
                    appBar: new AppBar(
                      title: new Text('Gallery Title'),
                      backgroundColor: themeColor,
                    ),
                    body: new ArtworkListPageBody())));
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
                galleryName.name,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing:
                Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
        ),
  ));
}

// makeListTile() {
// return ListTile(
//     contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//     leading: Container(
//       padding: EdgeInsets.only(right: 12.0),
//       decoration: new BoxDecoration(
//           // create a inset for the image
//           border: new Border(
//               right: new BorderSide(width: 1.0, color: Colors.white))),
//       child: Icon(Icons.image, color: Colors.white),
//     ),
//     title: Text(
//       "Gallery Name",
//       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//     ),
//     trailing:
//         Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
// }