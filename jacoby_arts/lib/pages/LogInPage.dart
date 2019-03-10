import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:jacoby_arts/authentication.dart';


class LogInPage extends StatefulWidget {
  LogInPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LogInPageState();
}

enum FormMode { LOGIN, SIGNUP }

class _LogInPageState extends State<LogInPage> {

  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _errorMessage;
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
  //_formKey.currenState.reset();
  _formKey.currentState.reset();
  _errorMessage = "";
  setState(() {
    _formMode = FormMode.SIGNUP;
  });
}

void _changeFormToLogin() {
  //_formKey.currentState.reset();
  _formKey.currentState.reset();
  _errorMessage = "";
  setState(() {
    _formMode = FormMode.LOGIN;
  });
}

void _validateAndSubmit() async {
  setState(() {
    _errorMessage = "";
    _isLoading = true;
  });
  if (_validateAndSave()) {
    String userId = "";
    try {
      if (_formMode == FormMode.LOGIN) {
        userId = await widget.auth.signIn(_email, _password);
        print('Signed in: $userId');
      } else {
        userId = await widget.auth.signUp(_email, _password);
        print('Signed up user: $userId');
      }
      if (userId.length>0 && userId != null) {
        widget.onSignedIn();
      }
    } catch (e) {
      print ('Error: $e');
      setState(() {
        _isLoading = false;
        if (_isIos) {
          _errorMessage = e.details;
        } else
          _errorMessage = e.message;
      });
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: topAppBar, body:_showBody());
  }

void _showVerifyEmailSentDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Verify your account"),
        content: new Text("A link to verify your account has been sent to your email."),
        actions: <Widget> [
          new FlatButton(
            child: new Text("Dismiss"),
            onPressed: () {
              _changeFormToLogin();
              Navigator.of(context).pop();
            }
          )
        ]
      );
    }
  );
}

Widget _showBody() {
  return new Container(
      padding: EdgeInsets.all(40.0),
      child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
              _showSecondaryButton(),
              _showErrorMessage()
            ],
          )));
}

Widget _showEmailInput() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        labelText: "Email: ",
        hintText: "Ex:  Bob.Ross@gmail.com",
        hintStyle: hintStyleText),
    validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
    onSaved: (value) => _email = value,
  );
}

Widget _showPasswordInput() {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
        labelText: "Password: ",
        hintText: "Ex:  happy_Tr33s",
        hintStyle: hintStyleText),
    validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
    onSaved: (value) => _password = value,
  );
}



Widget _showPrimaryButton() {
  return new MaterialButton(
    elevation: 5.0,
    minWidth: 200.0,
    height: 42.0,
    color: Colors.amberAccent,
    child: _formMode == FormMode.LOGIN
        ? new Text('Login', style: new TextStyle(fontSize: buttonTextSize))
        : new Text('Create account',
            style: new TextStyle(fontSize: buttonTextSize)),
    onPressed: _validateAndSubmit,
  );
}

Widget _showSecondaryButton() {
  return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Create an account',
              style: new TextStyle(fontSize: buttonTextSize - 2))
          : new Text('Already have an account? Sign in',
              style: new TextStyle(fontSize: buttonTextSize - 2)),
      onPressed: _formMode == FormMode.LOGIN
          ? _changeFormToSignUp
          : _changeFormToLogin);
}



Widget _showErrorMessage() {
  if (_errorMessage.length > 0 && _errorMessage != null) {
    return new Text(_errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300));
  } else {
    return new Container(
      height: 0.0,
    );
  }
}


final hintStyleText = TextStyle(color: Colors.black.withOpacity(0.2));

final loginBtn = new RaisedButton(
    onPressed: () {},
    color: Colors.amberAccent,
    splashColor: Colors.grey,
    disabledColor: Colors.grey,
    elevation: 2.0,
    highlightElevation: 8.0,
    disabledElevation: 0.0,
    textColor: Colors.black,
    disabledTextColor: Colors.black,
    child: new Text("Log In", style: new TextStyle(fontSize: buttonTextSize)));

final newUserBtn = new FlatButton(
    onPressed: () {}, textColor: themeColor, child: Text("Create account"));
}