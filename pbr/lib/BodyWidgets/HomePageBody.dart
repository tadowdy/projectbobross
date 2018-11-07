import 'package:flutter/material.dart';
import 'package:pbr/Pages/SurveyDetailsPage.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      //  color: color,
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Welcome!",
              style: new TextStyle(
                  fontSize: headingOneSize,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto"),
            ),
            new Text(
              " - Current Gallery",
              style: new TextStyle(
                  fontSize: headingTwoSize,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
            ),
            new Text(
              " - Upcoming",
              style: new TextStyle(
                  fontSize: headingTwoSize,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
            ),
            new Text(
              " ",
              style: new TextStyle(
                  fontSize: 50.0,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new Text(
              "Sign up to receive our newsletter",
              style: new TextStyle(
                  fontSize: headingThreeSize,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new TextField(
              decoration: const InputDecoration(
                hintText: "Enter e-mail here.",
              ),
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: contentTextSize,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            ButtonTheme(
              minWidth: medButtonWidth,
              height: buttonHeight,
              child: RaisedButton(
                onPressed: () {
                  // add email to db
                },
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: horizontalPadding),
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: buttonTextSize),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Text(
              " ",
              style: new TextStyle(
                  fontSize: 50.0,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new Text(
              "Help us out and take a survey!",
              style: new TextStyle(
                  fontSize: headingThreeSize,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            ButtonTheme(
              minWidth: medButtonWidth,
              height: buttonHeight,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SurveyDetailsPage()));
                },
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Text(
                        'Survey',
                        style: TextStyle(fontSize: buttonTextSize),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
