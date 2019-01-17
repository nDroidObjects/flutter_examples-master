import 'package:flutter/material.dart';

class SegmentBar extends StatefulWidget {
  @override
  _SegmentBarState createState() => new _SegmentBarState();
}

class _SegmentBarState extends State<SegmentBar> with SingleTickerProviderStateMixin {
  // TabController to control and switch tabs
  TabController _tabController;

  // Current Index of tab
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
    new TabController(vsync: this, length: 2, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Example"),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: new Container(
              decoration:
              new BoxDecoration(border: new Border.all(color: Colors.blue)),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Sign In Button
                  new FlatButton(
                    color: _currentIndex == 0 ? Colors.blue : Colors.white,
                    onPressed: () {
                      _tabController.animateTo(0);
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: new Text("SignIn"),
                  ),
                  // Sign Up Button
                  new FlatButton(
                    color: _currentIndex == 1 ? Colors.blue : Colors.white,
                    onPressed: () {
                      _tabController.animateTo(1);
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: new Text("SignUp"),
                  )
                ],
              ),
            ),
          ),
          new Expanded(
            child: new TabBarView(
                controller: _tabController,
                // Restrict scroll by user
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Sign In View
                  new Center(
                    child: new Text("SignIn"),
                  ),
                  // Sign Up View
                  new Center(
                    child: new Text("SignUp"),
                  )
                ]),
          )
        ],
      ),
    );
  }
}