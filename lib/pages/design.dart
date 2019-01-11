import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/52161244/card-overlapping-raised-button-in-flutter
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    LoginScreenState myAppState() => new LoginScreenState();
    return myAppState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(body: new Builder(
      builder: (BuildContext context) {
        return  Stack(
          children: <Widget>[
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Image.asset(
                  'assets/images/network_welcome.png',
                  fit: BoxFit.none,
            ),
               ],
             ),
             Center(
              child:  Container(
                child:  Card(
                  color: Colors.white,
                  elevation: 6.0,
                  margin: EdgeInsets.only(right: 15.0, left: 15.0),
                  child:  Wrap(
                    children: <Widget>[
                      Center(
                        child: new Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: new Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25.0, color: Colors.blue),
                          ),
                        ),
                      ),
                       ListTile(
                        leading: const Icon(Icons.person),
                        title: new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Please enter email',
                            labelText: 'Enter Your Email address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                       ListTile(
                        leading: const Icon(Icons.lock),
                        title: new TextFormField(
                          decoration: new InputDecoration(
                            hintText: 'Please enter password',
                            labelText: 'Enter Your Password',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        child: Center(
                          child: Text(
                            "FORGOT PASSWORD",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                          child: Text.rich(
                            TextSpan(
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'NEW USER ? ',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black)),
                                TextSpan(
                                    text: 'REGISTER',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        decoration: TextDecoration.underline,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: Center(
                          child: new RaisedButton(
                            onPressed: () {
                              print('Login Pressed');
                            },
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: new Text('Login',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),


           /* Container(
              child: Center(
                child: new RaisedButton(
                  onPressed: () {
                    print('Login Pressed');
                  },
                  color: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Text('Login',
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),*/



          ],
        );
      },
    )));
  }
}