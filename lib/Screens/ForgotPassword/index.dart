import 'package:flutter/material.dart';
import '../../Components/InputFields.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key key}) : super(key: key);
  @override
  ForgotScreenState createState() => new ForgotScreenState();
}

class ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(162, 146, 199, 0.8),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: new Center(
            child: new Container(
                padding: new EdgeInsets.all(24.0),
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
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                      new Form(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 50.0),
                              child: Text(
                                "Please check your mail after submitting email Id. reset your password after clicking on the link",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            new InputFieldArea(
                              hint: "Email",
                              obscure: false,
                              icon: Icons.person_outline,
                            ),
                            new Container(
                              width: 320.0,
                              height: 60.0,
                              margin: EdgeInsets.only(top: 25.0),
                              alignment: FractionalOffset.center,
                              decoration: new BoxDecoration(
                                color: const Color.fromRGBO(247, 64, 106, 1.0),
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(30.0)),
                              ),
                              child: new Text(
                                "Submit",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ])))));
  }
}
