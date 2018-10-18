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
      child:
      new Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: profilePicture),
          ]
      ),
    );
  }
}

final profilePicture = new Container(
  width: 300.0,
  height: 300.0,
  decoration:
    new BoxDecoration(
      color: Colors.orange,
      shape: BoxShape.circle,
    )

);