import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/SurveyDetailsPage.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/pages/LogInPage.dart';

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
      child: mainColumn(context),
    );
  }
}

Column mainColumn(context) {
  return new Column(
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
      emailField,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
      surveyButton(context),
      loginButton(context),
        ]
      )
    ],
  );
}

final emailField = new TextField(
  decoration: const InputDecoration(
    hintText: "Enter e-mail here.",
  ),
  textAlign: TextAlign.center,
  style: new TextStyle(
      fontSize: contentTextSize,
      color: const Color(0xFF080808),
      fontWeight: FontWeight.w200,
      fontFamily: "Roboto"),
);

ButtonTheme surveyButton(context) {
  return new ButtonTheme(
   // buttonColor: normalButton,
    minWidth: medButtonWidth,
    height: buttonHeight,
    child: RaisedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SurveyDetailsPage()));
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
  );
}
  ButtonTheme loginButton(context) {
    return new ButtonTheme(
    minWidth: medButtonWidth,
    height: buttonHeight,
    child: RaisedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LogInPage()));
      },
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: buttonTextSize),
            ),
          ),
        ],
      ),
    ),
    );
}
