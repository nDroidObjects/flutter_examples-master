import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FullScreenDialogPage(),
    );
  }
}

class NewDialogPage extends StatefulWidget {
  @override
  _NewDialogPageState createState() => new _NewDialogPageState();
}

class _NewDialogPageState extends State<NewDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Dialog"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              //TODO: handle save
            },
            child: new Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "This is a full screen dialog.",
              style: TextStyle(fontSize: 26.0),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenDialogPage extends StatefulWidget {
  @override
  _FullScreenDialogPageState createState() => new _FullScreenDialogPageState();
}

class _FullScreenDialogPageState extends State<FullScreenDialogPage> {
  void _openDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return NewDialogPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Screen Dialog"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset("images/100DOF.png")),
            Text(
              "This is a demo.",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _openDialog();
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
