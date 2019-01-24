import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';

class LoginPage extends StatelessWidget {
  LoginPage();
  @override
  Widget build(BuildContext context) {
    return loginScaffold(context);
  }
}

Scaffold loginScaffold(context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sunflowers'),
        backgroundColor: themeColor,
      ),
      body: Center(
          child: new SingleChildScrollView(
        child: mainColumn(context),
      )));
}

Column mainColumn(context) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      userInput,
      passInput,
      submitButtons(context),
    ],
  );
}

final userInput = new TextField(
  decoration: const InputDecoration(
    hintText: "Username",
  ),
  textAlign: TextAlign.left,
  style: new TextStyle(
    fontSize: headingThreeSize,
  ),
);

final passInput = new TextField(
  decoration: const InputDecoration(
    hintText: "Password",
  ),
  textAlign: TextAlign.left,
  style: new TextStyle(
    fontSize: headingThreeSize,
  ),
);

Row submitButtons(context){
  return new Row(
    
    children: <Widget>[
      signUpButton(context),
      loginButton(context),
    ],
  );
}
ButtonTheme loginButton(context) {
  return new ButtonTheme(
    buttonColor: normalButton,
    minWidth: medButtonWidth,
    height: buttonHeight,
    child: RaisedButton(
      onPressed: () {
        // confirm credentials
      },
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: horizontalPadding),
            child: Text(
              'Log In',
              style: TextStyle(fontSize: buttonTextSize),
            ),
          )
        ],
      ),
    ),
  );
}

ButtonTheme signUpButton(context) {
  return new ButtonTheme(
    buttonColor: normalButton,
    minWidth: medButtonWidth,
    height: buttonHeight,
    child: RaisedButton(
      onPressed: () {
        // confirm credentials
      },
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: horizontalPadding),
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: buttonTextSize),
            ),
          )
        ],
      ),
    ),
  );
}
