
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_login_register/data/database_helper.dart';
import 'package:flutter_login_register/models/user.dart';
import 'package:flutter_login_register/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  // ignore: unused_field
  BuildContext _ctx;
  // ignore: unused_field
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
   ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new CupertinoButton(
          child: new Text("Valider"),
          onPressed: _submit,
          color: Color.fromRGBO(0, 122, 253, 1)
          );
    var registerBtn = new CupertinoButton(child: new Text(""), onPressed: (){
      // Navigator.of(context).pushNamed("/register");
    });
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // new Text(
        //   "If you don't know your username and password you can always register",
        //   textScaleFactor: 1.0,
        // ),
       SizedBox(height: 60),
       CircleAvatar(
    radius: 78,
    backgroundColor: Colors.white,
    child: ClipOval(
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHA_iM3d5_gy-a3YKtsOx1VWmMkVOhLzRV1dVmuF72vwRN0YmP3QV6m2vSzoYYQwJfNkY&usqp=CAU',
          
        ),
    ),
),
      // Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHA_iM3d5_gy-a3YKtsOx1VWmMkVOhLzRV1dVmuF72vwRN0YmP3QV6m2vSzoYYQwJfNkY&usqp=CAU",
      
      // ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Identification"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Mot de passe"),
                ),
              )
            ],
          ),
        ),
        loginBtn,
        registerBtn
      ],
    );

    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Login Page"),
      // ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    // ignore: todo
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // ignore: todo
    // TODO: implement onLoginSuccess
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushNamed("/home");
  }
}
