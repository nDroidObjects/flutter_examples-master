import 'dart:async';

import 'package:flutter/material.dart';


class AsyncWidget extends StatefulWidget {
  @override
  _AsyncWidgetState createState() => _AsyncWidgetState();
}

class _AsyncWidgetState extends State<AsyncWidget> {
  Widget currentComponent;

  // INFO: a function which will setState() and change the current component in that state
  void _changeView(Widget component) {
    setState(() {
      currentComponent = component;
    });
  }

  // INFO: some function which will do some work asynchronously for us
  /**
   * The main to take away is that, when our async work is done, we
   * call `_changeView` with what ever component we want to display.
   */
  void _doAsyncWork() {
    const duration = const Duration(seconds: 5);

    // INFO: new widget to display
    Widget component = new Scaffold(
        appBar: new AppBar(
            title: new Text('Async Widget')
        ),
        body: new Center(
            child: new Container(
                child: new Text('Done Work')
            )
        )
    );
    Timer timedDelay = new Timer(duration, () {
      _changeView(component); // INFO: imporant
    });
  }

  @override
  void initState() {
    super.initState();

    // INFO: Set the currentComponent to display to the loading widget
    currentComponent = new LoadingScreen();

    // INFO: call some function that will do some async work for us
    _doAsyncWork();
  }

  @override
  Widget build(BuildContext context) {

    // INFO: display which ever component is in the current state (default: loading)
    return currentComponent;
  }
}



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => new _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this
    )..forward();
    _animation = new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
        reverseCurve: Curves.fastOutSlowIn
    )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      } else if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget component = new Scaffold(
        appBar: new AppBar(
            title: new Text('Loading...')
        ),
        body: new Container(
            child: new AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget child) {
                  return new Center(child: new CircularProgressIndicator());
                }
            )
        )
    );
    return component;
  }
}