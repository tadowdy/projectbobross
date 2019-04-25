import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';

class AccountPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //This is where the code for the body of your page will go
      child: new Column(
        children: <Widget>[
          Center(child: profileBackground),
          membershipInfo,
          membershipDesc,
        ],
      ),
    );
  }
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          new Text(
            "Jane Doe",
            style: headingOneBold,
          ),
        ],
      ),
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
  ),
);

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
