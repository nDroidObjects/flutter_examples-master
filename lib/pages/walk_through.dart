import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';



class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentIndexPage;
  int pageLength;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            PageView(
              children: <Widget>[
                Walkthrougth(textContent: "Walkthrough one"),
                Walkthrougth(textContent: "Walkthrough two"),
                Walkthrougth(textContent: "Walkthrough tree"),
                Walkthrougth(textContent: "Walkthrough four"),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              // left: MediaQuery.of(context).size.width * 0.35,
              child: Padding(
                padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.38),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: new DotsIndicator(
                      numberOfDot: pageLength,
                      position: currentIndexPage,
                      dotColor: Colors.white,
                      dotActiveColor: Colors.red),
                ),
              ),
            )
          ],
        ));
  }
}

class Walkthrougth extends StatelessWidget {
  final String textContent;
  Walkthrougth({Key key, @required this.textContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: Text(textContent)),
    );
  }
}