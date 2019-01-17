import 'package:flutter/material.dart';

void main() => runApp(LimeApp());

class LimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lime',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 50.0,
        ),
        child: PageView(
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.8,
          ),
          children: [
            Container(margin: EdgeInsets.symmetric(horizontal: 10.0,), color: Colors.redAccent),
            Container(margin: EdgeInsets.symmetric(horizontal: 10.0,), color: Colors.purpleAccent),
            Container(margin: EdgeInsets.symmetric(horizontal: 10.0,), color: Colors.greenAccent)
          ],

        ),
      ),
    );
  }
}