
import 'package:flutter/material.dart';
import 'package:jacoby_arts/pages/SurveyDetailsPage.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/pages/LogInPage.dart';
import 'package:url_launcher/url_launcher.dart';

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
        'Welcome!',
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
        "Visit Us",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto"),
      ),
      new Text(
        "627 E.Broadway, Alton,IL 62002",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"),
      ),
      new Text(
        "Phone: +1.618.462.5222\n",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"),
      ),
      new Text(
        "Hours:",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto"),
      ),
      new Text(
        "Wednesday - Saturday: 10am-5pm",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"),
      ),
      new Text(
        "Sunday: 12pm-4pm",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"),
      ),
      new Text(
        "Admission is Free\n",
        style: new TextStyle(
            fontSize: headingThreeSize,
            color: const Color(0xFF080808),
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto"),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
      newsletterButton(context),
      //surveyButton(context),
      loginButton(context),
        ]
      )
    ],
  );
}


ButtonTheme newsletterButton(context) {
  return new ButtonTheme(
   // buttonColor: normalButton,
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

// ButtonTheme surveyButton(context) {
//   return new ButtonTheme(
//    // buttonColor: normalButton,
//     minWidth: medButtonWidth,
//     height: buttonHeight,
//     child: RaisedButton(
//       onPressed: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => SurveyDetailsPage()));
//       },
//       child: new Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(right: 6.0),
//             child: Text(
//               'Survey',
//               style: TextStyle(fontSize: buttonTextSize),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
  ButtonTheme loginButton(context) {
    return new ButtonTheme(
    minWidth: medButtonWidth,
    height: buttonHeight,
    child: RaisedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginPage()));
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
