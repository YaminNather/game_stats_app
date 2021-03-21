import "package:flutter/material.dart";
import 'package:game_stats_app/pages/test-page-1/modal-page/damage-calculator-page/hud/bar/bar.dart';

class WHUD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 5.0,
      child: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _fbuildUpperRow(),

            _fbuildShieldBar(),

            new SizedBox(height: 5.0),

            _fbuildHealthBar(),

            new SizedBox(height: 5.0),

            _fbuildLowerRow()
          ]
        )
      )
    );
  }

  Widget _fbuildUpperRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Text("TTK: 20"),

            new SizedBox(width: 20.0),

            new Text("DPS: 200")
          ],                    
        ),

        new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[                        
            new CircleAvatar(backgroundColor: Colors.blue),
            
            new SizedBox(width: 20.0), 

            new CircleAvatar(backgroundColor: Colors.purple)
          ]
        )
      ],
    );
  }

   Widget _fbuildShieldBar() => WBar(5, 3, 40.0, 75.0, Colors.blue);

  Widget _fbuildHealthBar() => WBar(1, 1, 50.0, 100.0, Colors.white);

  Widget _fbuildLowerRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new CircleAvatar(backgroundColor: Colors.grey),
        
        new SizedBox(width: 5.0),

        new Text("20"),

        new SizedBox(width: 10.0),

        new CircleAvatar(backgroundColor: Colors.grey),

        new SizedBox(width: 5.0),

        new Text("20")
      ]
    );
  }
 }