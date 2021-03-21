import "package:flutter/material.dart";
import 'package:game_stats_app/widgets/counter/counter.dart';

class WCounterTestPage extends StatefulWidget {
  @override
  _WCounterTestPageState createState() => _WCounterTestPageState();
}

class _WCounterTestPageState extends State<WCounterTestPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Counter Test Page")),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          fbuildCounterWithLabel("Upper Limbs"),
          
          fbuildCounterWithLabel("Lower Limbs"),
          
          fbuildCounterWithLabel("Head"),
        ],
      )     
    );
  }


  Widget fbuildCounterWithLabel(String label) {
    return new Container(
      margin: new EdgeInsets.only(top: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Upper Limbs"),

          new SizedBox(width: 20.0),

          new WCounter(0, mheight: 50.0, mlowerRange: 0, mupperRange: 5)
        ]
      ),
    );
  }
}