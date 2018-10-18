import 'package:flutter/material.dart';

class AccountPageBody extends StatelessWidget {
  AccountPageBody();

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
      //This is where the code for the body of your page will go
      child: new Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: profileBackground),
            membershipInfo,
            membershipDesc,
          ]),
    );
  }
}

final profileBackground = new Container(
  margin: const EdgeInsets.symmetric(
    vertical: 60.0,
  ),
  child: CircleAvatar(
    backgroundColor: Colors.orange[200],
    radius: 75.0,
    child: Image.asset('images/profile_temp.png'),
  ),
);

final membershipInfo = new Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 30.0,
    ),
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // allow left alignment for the text
      children: <Widget>[
        Row(children: <Widget>[
          new Text("Jane Doe",
              style: new TextStyle(
                fontSize: 35.0,
              )),
        ]),
        new Text(
          "Membership Level: Gold",
          style: new TextStyle(fontSize: 15.0),
          textAlign: TextAlign.left,
        ),
        new Text(
          "Expiriation Date: 10/10/2019",
          style: new TextStyle(fontSize: 15.0),
          textAlign: TextAlign.left,
        ),
      ],
    ));

final membershipDesc = new Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 30.0,
    vertical: 20.0,
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
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          );
        }).toList(),
        onChanged: (_) {},
      )
    ],
  ),
);
