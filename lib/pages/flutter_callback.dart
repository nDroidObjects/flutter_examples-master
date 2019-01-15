import 'package:flutter/material.dart';


class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _text = 'hello world';
  Color _color = Colors.red;

  void _onSelectionChanged(int value) {
    if (value == 0) {
      setState(() {
        _text = "0 selected";
        _color = Colors.blue;
      });
    } else if (value == 1) {
      setState(() {
        _text = "1 selected";
        _color = Colors.yellow;
      });
    } else {
      setState(() {
        _text = "unknown value selected";
        _color = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Callback Demo"),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Widget1(
              onChanged: _onSelectionChanged,
            ),

            Widget2(
              text: _text,
              color: _color,
            )

          ],
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  final ValueChanged<int> onChanged;

  const Widget1({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      items: [
        DropdownMenuItem(child: Text("Zero",style: TextStyle(color: Colors.black),), value: 0),
        DropdownMenuItem(child: Text("One", style: TextStyle(color: Colors.black),),value: 1),
      ],

      onChanged: onChanged,

    );
  }
}

class Widget2 extends StatelessWidget {
  final String text;
  final Color color;

  const Widget2({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: color,
        child: Text(text),
      ),
    );
  }
}
