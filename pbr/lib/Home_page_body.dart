import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  HomePage();

  @override
   Widget build(BuildContext context) {
   return Container(
    //  color: color,
          child:
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
   );
 }

}