import 'package:flutter/material.dart';


class CardsDemo extends StatefulWidget {
  @override
  _CardsDemoState createState() => new _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cards'),
      ),
      body: new Column(
        children: <Widget>[
          new Center(
            child: new Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Text(
                'Sub Title',
                style:
                new TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          new Expanded(
            child: new ListView(
              children: _buildCards(),
              padding: const EdgeInsets.all(8.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(CardModel card) {
    List<Widget> columnData = <Widget>[];

    if (card.isHeaderAvailable) {
      columnData.add(
        new Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: new Text(
            card.headerText,
            style: new TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    for (int i = 0; i < card.allText.length; i++)
      columnData.add(
        new Text(card.allText[i], style: new TextStyle(fontSize: 22.0),),
      );

    return new Card(
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(children: columnData),
      ),
    );
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [];
    for (int i = 0; i < sampleCards.length; i++) {
      cards.add(_buildCard(sampleCards[i]));
    }

    return cards;
  }
}

class CardModel {
  final String headerText;
  final List<String> allText;
  final bool isHeaderAvailable;

  CardModel(
      {this.headerText = "", this.allText, this.isHeaderAvailable = false});
}

List<CardModel> sampleCards = [
  new CardModel(allText: ["Card 1 Text"]),
  new CardModel(
      isHeaderAvailable: true,
      headerText: "Card 2 Header",
      allText: ["Card 2 Text Line 1", "Card 2 Text Line 2"]),
  new CardModel(allText: ["Card 3 Text"]),
];