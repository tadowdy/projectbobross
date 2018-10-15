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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            new Text(
              "Put the Account Details Here..",
              style: new TextStyle(fontSize:30.0,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto"),
            ),
          ]
      ),
    );
  }
}
