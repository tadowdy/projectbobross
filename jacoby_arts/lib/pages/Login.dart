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
      body: Center(
          child: new ListView(
    shrinkWrap: true,
    children: <Widget>[
      logo,
      mainColumn(context),
    ],
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
      loginButton(context),
      signupButton(context),
    ],
  );
}

final logo = Hero(
  tag: 'hero',
  child: CircleAvatar(
    backgroundColor: Colors.transparent,
    radius: 45.0,
    child: Image.asset('images/squares_logo.png'),
  ),
);

final userInput = TextFormField(
  keyboardType: TextInputType.emailAddress,
  autofocus: true,
  initialValue: 'email@gmail.com',
  decoration: InputDecoration(
    hintText: 'Email',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  ),
);

final passInput = TextFormField(
  autofocus: false,
  initialValue: 'some password',
  obscureText: true,
  decoration: InputDecoration(
    hintText: 'Password',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  ),
);

Padding loginButton(context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: topPadding),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {}, // check credentials and move to account page
      padding: EdgeInsets.all(12),
      color: brightButton,
      child: Text('Log In', style: TextStyle(color: Colors.white)),
    ),
  );
}

Padding signupButton(context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: topPadding),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {}, // allow user to create an account
      padding: EdgeInsets.all(12),
      color: normalButton,
      child: Text('Sign Up', style: TextStyle(color: Colors.white)),
    ),
  );
}
