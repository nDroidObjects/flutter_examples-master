import 'package:flutter/material.dart';

class RoutingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
            break;
          case '/dashboard':
            return MaterialPageRoute(builder: (context) => Dashboard());
            break;
        }
      },
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
//            Route route = MaterialPageRoute(builder: (context) => Dashboard());
//            Navigator.push(context, route);
            Navigator.pushNamed(context, '/dashboard');
          },
          child: Text('Move to Page 2'),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}