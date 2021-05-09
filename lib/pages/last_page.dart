import 'package:flutter/material.dart';

import 'landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int qNum;

  ScorePage(this.score, this.qNum);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Your Score Is:",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold),
          ),
          new Text(
            score.toString() + "/" + qNum.toString(),
            style: new TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          new IconButton(
              icon: new Icon(Icons.arrow_right_alt),
              color: Colors.white,
              iconSize: 250.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new LandingPage()),
                  (Route route) => route == null))
        ],
      ),
    );
  }
}
