import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.google.com',
      appBar: new AppBar(
        title: Text("WebView", textDirection: TextDirection.ltr,),
        actions: <Widget>[
          Center(
            child: Container(
              child: RaisedButton(
                child: Text("Open In Browser"),
                onPressed: () {
                  _launchURL('https://www.google.com');
                },
              ),
              margin: EdgeInsets.only(right: 10.0),
            ),
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
