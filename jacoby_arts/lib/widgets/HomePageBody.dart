import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/pages/LogInPage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: mainColumn(context),
    );
  }
}

Widget mainColumn(context) {
  return new SingleChildScrollView(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          'Welcome!',
          style: new TextStyle(
            fontSize: headingOneSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
          ),
        ),
        new Text(
          "\nJacoby Arts Center",
          style: new TextStyle(
            fontSize: headingTwoSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .9,
          child: new Text(
            "nurtures and promotes the practice and appreciation of the arts through Education, Exhibitions, Cultural Programming, and Outreach Initiatives.",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: headingThreeSize,
              color: const Color(0xFF080808),
              fontWeight: FontWeight.w200,
              fontFamily: "Roboto",
            ),
          ),
        ),
        new Text(
          "\nCome Visit, It's Free!",
          style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
          ),
        ),
        new Text(
          "627 E Broadway Alton, IL 62002",
          style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto",
          ),
        ),
        new Text(
          "\nOpen Hours",
          style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
          ),
        ),
        new Text(
          "Wednesday-Saturday: 10am-5pm",
          style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto",
          ),
        ),
        new Text(
          "Sunday: 12pm-4pm\n",
          style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            newsletterButton(context),
//// THE FOLLOWING PAGE IS NOT COMPLETE, HIDE IT BUT DO NOT REMOVE IT
//            loginButton(context),
          ],
        ),
        Divider(
          color: const Color(0xFAFAFA),
          height: 36,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.black,
              ),
            ),
            Text(" Contact Us "),
            Expanded(
              child: Divider(
                color: Colors.black,
              ),
            ),
          ],
        ),
        new Text(
          "\nPhone: +1.618.462.5222\nEmail: jacobyartscenter@gmail.com",
          textAlign: TextAlign.left,
          style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto",
          ),
        ),
        Divider(
          color: Colors.black,
          height: 48,
        ),
      ],
    ),
  );
}

ButtonTheme newsletterButton(context) {
  return new ButtonTheme(
    minWidth: medButtonWidth,
    height: buttonHeight,
    child: RaisedButton(
      onPressed: () => launch("https://www.jacobyartscenter.org/#newsletter"),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Text(
              'Newsletter',
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
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
