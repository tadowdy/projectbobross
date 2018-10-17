import 'package:flutter/material.dart';
import 'package:pbr/BodyWidgets/HomePageBody.dart';
import 'package:pbr/BodyWidgets/GalleryListPageBody.dart';
import 'package:pbr/BodyWidgets/EventListPageBody.dart';
import 'package:pbr/BodyWidgets/DonatePageBody.dart';
import 'package:pbr/BodyWidgets/AccountPageBody.dart';

class Home extends StatefulWidget{
@override
State<StatefulWidget> createState() {
  return _HomeState();
  }
}
class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageBody(),
    GalleryListPageBody(),
    EventListPageBody(),
    DonatePageBody(),
    AccountPageBody()
  ];
 @override
 Widget build(BuildContext context) {
   return Scaffold(
    appBar: new AppBar(
      title: new Image(image: new AssetImage('images/full_logo.png')),
      // title: new Text('Jacoby Art Center'),
      // new Image.asset('assets/full_logo.png', fit: BoxFit.cover),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.camera_alt),
          tooltip: 'QR scan',
          onPressed: () {
              /////go to camera
          },
        ),
        
      ],
    ),
     body: _children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blueGrey,
          primaryColor: Colors.orange,
          textTheme: Theme
          .of(context)
          .textTheme
          .copyWith(caption: new TextStyle(color: Colors.orange[100]))
          ),
        child: new BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('Home'),
              ),
      
              BottomNavigationBarItem(
                icon: new Icon(Icons.image),
                title: new Text('Gallery'),
              ),
      
              BottomNavigationBarItem(
                icon: new Icon(Icons.today),
                title: new Text('Events'),
              ),

              BottomNavigationBarItem(
                icon: new Icon(Icons.shopping_cart),
                title: new Text('Cart'),
              ),
      
              BottomNavigationBarItem(
                icon: new Icon(Icons.account_circle),
                title: new Text('Account'),
              )
            ],
            type: BottomNavigationBarType.fixed,
            iconSize: 30.0,
        ),
      )
   );
 }
 void onTabTapped(int index){
   setState(() {
        _currentIndex = index;
      });
 }
}