import 'package:flutter/material.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jacoby_arts/AppLanding.dart';
import 'package:jacoby_arts/globals.dart' as globals;


final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

  enum FormMode { LOGIN, SIGNUP }

class _LoginPageState extends State<LoginPage> {
  String _email, _password, _passwordVerify, _firstName, _lastName;
  var _passwordKey = GlobalKey<FormFieldState>();

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
        globals.user.fbuser = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
        globals.user.getUser(globals.user.fbuser.uid);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        Navigator.pop(context);
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
        globals.user.fbuser = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        globals.user.fbuser.sendEmailVerification();
        _showPasswordVerifyInput();
        globals.user.createUser(_firstName, _lastName, _email, globals.user.fbuser.uid);
        globals.user.getUser(globals.user.fbuser.uid);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        Navigator.pop(context);
      }catch(e){
        print(e.message);
      }
    }
  }

  void signOut() async {
    globals.user.signOut();
    Navigator.pop(context);
      }
  

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
               children: globals.user.fbuser != null
               ? <Widget>[
                 _displayUser(),
                 _signOutBtn()
               ]
               :
               _formMode == FormMode.SIGNUP 
                ? <Widget>[
                _showFirstNameInput(),
                _showLastNameInput(),
                _showEmailInput(),
                _showPasswordInput(),
                _showPasswordVerifyInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showErrorMessage()
              ]
              :  <Widget>[
                _showEmailInput(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showSecondaryButton(),
                _showErrorMessage()
              ],
            )));
  }

  Widget _displayUser() {
    return Text('You are signed in as ${globals.user.fbuser.email}', style: headingThreeBold);
  }

  Widget _signOutBtn() {
      return new MaterialButton(
      elevation: 5.0,
      minWidth: 200.0,
      height: 42.0,
      color: Colors.amberAccent,
      child: 
          new Text('Sign Out', style: new TextStyle(fontSize: buttonTextSize)),
              onPressed: signOut
    );
  }

  Widget _showFirstNameInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "First Name ",
        hintText: "Ex: John",
        hintStyle: hintStyleText),
        validator: (input) {
          if(input.isEmpty){
            return 'Please enter a first name';
          }
        },
        onSaved: (input) => _firstName = input,
      );
  }

  Widget _showLastNameInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Last Name ",
        hintText: "Ex: Doe",
        hintStyle: hintStyleText),
        validator: (input) {
          if(input.isEmpty){
            return 'Please enter a last name';
          }
        },
        onSaved: (input) => _lastName = input,
      );
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
      key: _passwordKey,
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password: ",
          hintText: "Ex:  happy_Tr33s",
          hintStyle: hintStyleText),
      validator: (input) {
        if(input.length < 6){
          return 'Your password must be at least 6 characters long';
        }
      }, 
      onSaved: (value) => _password = value,
    );
  }

  Widget _showPasswordVerifyInput() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Verify password ",
          hintStyle: hintStyleText),
      validator: (input) {
        var password =_passwordKey.currentState.value;
        if(input != password){
          return 'Your passwords must match!';
        }
      }, 
      onSaved: (value) => _passwordVerify = value,
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


}
