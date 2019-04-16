import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/globals.dart' as globals;
import 'package:jacoby_arts/pages/LogInPage.dart';

class AccountPageBody extends StatefulWidget {
  @override
  _AccountPageBody createState() => _AccountPageBody();
}

class _AccountPageBody extends State<AccountPageBody> {

  void _updateAccountDetails() {
    // TODO: update the account details using a DAO.
  }

  void _switchViewToAccountSettingsPage(/*Account account*/) {
    // TODO: create new AccountSettingsPage w. account..
    // TODO: build and push AccountSettingsPage onto the nav stack..
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(topPadding),
      //This is where the code for the body of your page will go
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: 
          globals.user.fbuser == null
           ?  <Widget>[
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
             Text("Please sign in to access membership benefits",
             style: new TextStyle(
          fontSize: contentTextSize,
          color: const Color(0xFF080808),
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto"),),]),
             loginButton(context)
           ]
           :  <Widget>[
            membershipInfo,
            membershipDesc,
          ]),
    );
  }
}

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

final profileBackground = new Container(
  margin: const EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
    top: topPadding,
  ),
  child: CircleAvatar(
    backgroundColor: Colors.orange[200],
    radius: 75.0,
    child: Image.asset('images/profile_temp.png'),
  ),
);

final membershipInfo = new Container(
    margin: const EdgeInsets.only(
      top: verticalWidgetPadding,
      left: horizontalPadding,
      right: horizontalPadding,
    ),
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // allow left alignment for the text
      children: <Widget>[
        Row(children: <Widget>[
          globals.user.fbuser == null
          ? new Text("Jane Doe", style: headingOneBold)
          : new Text('${globals.user.fbuser.email}', style: headingOneBold),
        ]),
        new Row(
          children: <Widget>[
            new Text(
              "Membership Level: ",
              style: headingTwoBold,
              textAlign: TextAlign.left,
            ),
            new Text(
              "Gold",
              style: headingTwo,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            new Text(
              "Expiriation Date: ",
              style: headingTwoBold,
              textAlign: TextAlign.left,
            ),
            new Text(
              "10/10/2019",
              style: headingTwo,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    ));

final membershipDesc = new Container(
  margin: const EdgeInsets.only(
    top: verticalWidgetPadding,
    left: horizontalPadding,
    right: horizontalPadding,
  ),
  child: new Row(
    children: <Widget>[
      DropdownButton<String>(
        value: "Membership Benefits",
        items: <String>[
          'Membership Benefits',
          'Benefit A',
          'Benefit B',
          'Benefit C',
          'Benefit D'
        ].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(
              value,
              style: headingThree,
            ),
          );
        }).toList(),
        onChanged: (_) {},
      )
    ],
  ),
);
