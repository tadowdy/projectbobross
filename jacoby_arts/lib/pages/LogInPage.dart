import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jacoby_arts/AppLanding.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
  
}

  enum FormMode { LOGIN, SIGNUP }

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar,
      body: _showBody()
    );
  }

  FormMode _formMode = FormMode.LOGIN;

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
    Future<void> signUp() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }


// class _LogInPageState extends State<LogInPage> {
//   final _formKey = new GlobalKey<FormState>();
//   String _email;
//   String _password;
  String _errorMessage;

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

  // void _validateAndSubmit() async {
  //   setState(() {
  //     _errorMessage = "";
  //     _isLoading = true;
  //   });
  //   if (_validateAndSave()) {
  //     String userId = "";
  //     try {
  //       if (_formMode == FormMode.LOGIN) {
  //         userId = await widget.auth.signIn(_email, _password);
  //         print('Signed in: $userId');
  //       } else {
  //         userId = await widget.auth.signUp(_email, _password);
  //         print('Signed up user: $userId');
  //       }
  //       if (userId.length > 0 && userId != null) {
  //         widget.onSignedIn();
  //       }
  //     } catch (e) {
  //       print('Error: $e');
  //       setState(() {
  //         _isLoading = false;
  //         if (_isIos) {
  //           _errorMessage = e.details;
  //         } else
  //           _errorMessage = e.message;
  //       });
  //     }
  //   }
  // }



// // void _showVerifyEmailSentDialog() {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: new Text("Verify your account"),
// //         content: new Text("A link to verify your account has been sent to your email."),
// //         actions: <Widget> [
// //           new FlatButton(
// //             child: new Text("Dismiss"),
// //             onPressed: () {
// //               _changeFormToLogin();
// //               Navigator.of(context).pop();
// //             }
// //           )
// //         ]
// //       );
// //     }
// //   );
// // }

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
      validator: (input) {
        if(input.isEmpty){
          return 'Please type an email';
        }
      }, 
      onSaved: (input) => _email = input,
    );
  }

  Widget _showPasswordInput() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password: ",
          hintText: "Ex:  happy_Tr33s",
          hintStyle: hintStyleText),
      validator: (input) {
        if(input.length<6){
          return 'Your password must be at least 6 characters';
        }
      }, 
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
      onPressed: _formMode == FormMode.LOGIN
          ? signIn
          : signUp
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
      child:
          new Text("Log In", style: new TextStyle(fontSize: buttonTextSize)));

  final newUserBtn = new FlatButton(
      onPressed: () {}, textColor: themeColor, child: Text("Create account"));
}
