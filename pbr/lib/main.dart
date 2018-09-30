import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF212121),
        accentColor: const Color(0xFF64ffda),
        canvasColor: const Color(0xFF303030),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Jacoby Art Center'),
          
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text(
              "Welcome!",
                style: new TextStyle(fontSize:30.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              " - Current Gallery",
                style: new TextStyle(fontSize:20.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),   
              new Text(
              " - Upcoming",
                style: new TextStyle(fontSize:20.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new Text(
                " ",
                style: new TextStyle(fontSize:50.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "Sign up to receive our newsletter",
                style: new TextStyle(fontSize:15.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              
    
              new TextField(
                style: new TextStyle(fontSize:12.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new RaisedButton(key:null, onPressed:buttonPressed,
                color: const Color(0xFFe0e0e0),
                child:
                  new Text(
                  "Sign up",
                    style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFFffffff),
                    fontWeight: FontWeight.w300,
                    fontFamily: "Roboto"),
                  )
                ),
    
              new Text(
                " ",
                style: new TextStyle(fontSize:50.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "Help us out and take a survey",
                style: new TextStyle(fontSize:15.0,
                color: const Color(0xFFffffff),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              )
            ]
    
          ),
    
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: new Text('Home'),
            ),
    
            new BottomNavigationBarItem(
              icon: const Icon(Icons.image),
              title: new Text('Galleries'),
            ),
    
            new BottomNavigationBarItem(
              icon: const Icon(Icons.school),
              title: new Text('Classes'),
            ),
    
            new BottomNavigationBarItem(
              icon: const Icon(Icons.monetization_on),
              title: new Text('Donate'),
            ),
    
            new BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              title: new Text('Account'),
            )
          ]
    
        ),
      );
    }
    void buttonPressed(){}
    
}