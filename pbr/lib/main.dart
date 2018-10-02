import 'package:flutter/material.dart';


void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PBR',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        accentColor: Colors.orange,
        canvasColor: const Color(0xFFfafafa),
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
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              new Text(
              "Welcome!",
                style: new TextStyle(fontSize:30.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              " - Current Gallery",
                style: new TextStyle(fontSize:20.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),   
              
              new Text(
              " - Upcoming",
                style: new TextStyle(fontSize:20.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
              ),
    
              new Text(
                " ",
                style: new TextStyle(fontSize:50.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "Sign up to receive our newsletter",
                style: new TextStyle(fontSize:15.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
              new TextField(
                decoration: const InputDecoration(
                  hintText: "Enter e-mail here.",
                ),
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),

              ButtonTheme(
                minWidth: 50.0,
                height: 30.0,
                child: RaisedButton(
                  onPressed: () {
                    // add email to db
                  },
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(right:6.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              
              new Text(
                " ",
                style: new TextStyle(fontSize:50.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
    
              new Text(
              "Help us out and take a survey!",
                style: new TextStyle(fontSize:15.0,
                color: const Color(0xFF080808),
                fontWeight: FontWeight.w200,
                fontFamily: "Roboto"),
              ),
              ButtonTheme(
                minWidth: 50.0,
                height: 30.0,
                child: RaisedButton(
                  onPressed: () {
                    // add email to db
                  },
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(right:6.0),
                      child: Text(
                        'Survey',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
    
          ),

        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blueGrey,
            primaryColor: Colors.orange,
            textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.orange[100]))),
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
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
                icon: new Icon(Icons.monetization_on),
                title: new Text('Donate'),
              ),
      
              BottomNavigationBarItem(
                icon: new Icon(Icons.account_circle),
                title: new Text('Account'),
              )
            ],
          ),
          )
      );
    }
    void signup(){
      ///add to email to DB for news letter
    }
    
}