import 'package:flutter/material.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/SignUpLink.dart';
import '../../Components/Form.dart';
import '../../Components/SignInButton.dart';
import '../../Components/BabyImage.dart';
import 'package:flutter/services.dart';
import '../ForgotPassword/index.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../../Bloc/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final vm = new LoginViewModel();
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  _authenticateUser(AsyncSnapshot<dynamic> snapshot) async {
    print(snapshot.data);
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/home"),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Center(
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(162, 146, 199, 0.8),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(height: 250.0, width: null),
                              new Container(
                                  margin: new EdgeInsets.only(
                                      right: 20.0,
                                      left: 20.0,
                                      bottom: 10.0,
                                      top: 10.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        StreamBuilder(
                                            stream: vm.emailStream,
                                            builder: (BuildContext context,
                                                AsyncSnapshot<dynamic>
                                                    snapshot) {
                                              return TextField(
                                                onChanged: vm.updateEmail,
                                                obscureText: false,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: new InputDecoration(
                                                  errorText: snapshot.error,
                                                  icon: new Icon(
                                                    Icons.lock_outline,
                                                    color: Colors.white,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText: 'email',
                                                  hintStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          top: 30.0,
                                                          right: 30.0,
                                                          bottom: 30.0,
                                                          left: 5.0),
                                                ),
                                              );
                                            }),
                                        StreamBuilder(
                                            stream: vm.passwordStream,
                                            builder: (BuildContext context,
                                                AsyncSnapshot<dynamic>
                                                    snapshot) {
                                              return TextField(
                                                onChanged: vm.updatePassword,
                                                obscureText: true,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: new InputDecoration(
                                                  errorText: snapshot.error,
                                                  icon: new Icon(
                                                    Icons.lock_outline,
                                                    color: Colors.white,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText: 'Password',
                                                  hintStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          top: 30.0,
                                                          right: 30.0,
                                                          bottom: 30.0,
                                                          left: 5.0),
                                                ),
                                              );
                                            }),
                                      ])),
                              GestureDetector(
                                  //You need to make my child interactive
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotScreen()),
                                    );
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 200.0, top: 18.0),
                                      child: Text("Forogt password",
                                          textAlign: TextAlign.right,
                                          style:
                                              TextStyle(color: Colors.white)))),
                              new SignUp()
                            ],
                          ),
                          animationStatus == 0
                              ? loginButton(vm)
                              : new StaggerAnimation(
                                  buttonController: _loginButtonController.view,
                                  login: true),
                        ],
                      ),
                    ],
                  ))),
        )));
  }

  Widget loginButton(LoginViewModel vm) {
    return StreamBuilder(
      stream: vm.submitValid,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: new InkWell(
              onTap: snapshot.hasData
                  ? () {
                      setState(() {
                        animationStatus = 1;
                      });
                      _playAnimation();
                      _authenticateUser(snapshot);
                    }
                  : null,
              child: new SignIn()),
        );
      },
    );
  }
}
