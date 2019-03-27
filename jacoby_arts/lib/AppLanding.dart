import 'package:flutter/material.dart';
import 'package:jacoby_arts/widgets/HomePageBody.dart';
import 'package:jacoby_arts/widgets/ArtworkListPageBody.dart';
import 'package:jacoby_arts/widgets/EventListPageBody.dart';
import 'package:jacoby_arts/widgets/CartPageBody.dart';
import 'package:jacoby_arts/widgets/AccountPageBody.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageBody(),
    ArtworkListPageBody(),
    EventListPageBody(),
    CartPageBody(),
    AccountPageBody()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topAppBar,
        body: _children[_currentIndex],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: themeColor,
              primaryColor: iconSelectedColor,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: iconColor))),
          child: new BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex:
                _currentIndex, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.image),
                title: new Text('Artwork'),
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
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
