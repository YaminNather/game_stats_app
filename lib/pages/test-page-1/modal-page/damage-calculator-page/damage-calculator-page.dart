import "package:flutter/material.dart";
import 'package:game_stats_app/models/apex-legends/gun-data.dart';
import 'package:game_stats_app/widgets/counter/counter.dart';

import 'hud/hud.dart';

class WDamageCalcPage extends StatefulWidget {
  WDamageCalcPage(this._mgunData);

  @override
  _WDamageCalcPageState createState() => new _WDamageCalcPageState();


  final GunData _mgunData;
}

class _WDamageCalcPageState extends State<WDamageCalcPage> {  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          "Damage\n   Calculator", 
          style: theme.textTheme.headline2.copyWith(fontWeight: FontWeight.bold)
        ),

        new Divider(color: Colors.white),
        
        new SizedBox(height: 20.0),

        new WHUD(),

        new SizedBox(height: 20.0),

        new Expanded(
          flex: 100,
          child: _fbuildCounters(),
        )
      ]
    );
  }

  Widget _fbuildCounters() {
    return new ListView( 
      physics: new BouncingScrollPhysics(parent: new ScrollPhysics()),         
      children: <Widget>[
        _fbuildCounter("Head"),

        new SizedBox(height: 20.0),

        _fbuildCounter("Torso"),

        new SizedBox(height: 20.0), 

        _fbuildCounter("L.Limbs"),
      ]
    );
  }

  Widget _fbuildCounter(String name) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          width: 50.0, height: 50.0,
          decoration: new BoxDecoration(
            color: Colors.grey, borderRadius: new BorderRadius.circular(2000.0)
          )
        ),

        new SizedBox(width: 20.0),

        new Expanded(flex: 100, child: new Text(name)),

        new SizedBox(width: 20.0),

        new WCounter(0, mlowerRange: 0, mwidth: 200.0, mheight: 50.0)
      ]
    );
  }  
}