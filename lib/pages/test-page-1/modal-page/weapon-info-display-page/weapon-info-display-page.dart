import "package:flutter/material.dart";
import 'package:game_stats_app/models/apex-legends/gun-data.dart';
import 'package:game_stats_app/pages/test-page-1/modal-page/weapon-info-display-page/base-stats/base-stats.dart';

class WWeaponInfoDisplayPage extends StatefulWidget {
  WWeaponInfoDisplayPage(this._mgunData);

  @override
  _WWeaponInfoDisplayPageState createState() => _WWeaponInfoDisplayPageState();


  final GunData _mgunData;
}

class _WWeaponInfoDisplayPageState extends State<WWeaponInfoDisplayPage> {  
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: [
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(height: 20.0),

            _fbuildHeading(context),        
            
            new SizedBox(height: 50.0),

            new WBaseStats(widget._mgunData)
          ]
        ),
      ],
    );
  }  

  Widget _fbuildHeading(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return new Card(      
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children: <Widget>[                                                                                        
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(widget._mgunData.mname, style: textTheme.headline3),

                new Text(
                  "   ${widget._mgunData.fgetWeaponTypeAsString()}", 
                  style: textTheme.subtitle1
                )                
              ],
            ),

            new Row(
              children: [
                _fbuildAmmoTypeLbl(),

                new SizedBox(width: 5.0)
              ],
            )
          ]      
        ),
      ),
    );
  }

  Widget _fbuildAmmoTypeLbl() {
    return new Container(
      width: 80.0, height: 30.0,                  
      decoration: new BoxDecoration(
        color: widget._mgunData.fgetColorFromGunData(),
        borderRadius: new BorderRadius.circular(2.0)
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(widget._mgunData.fgetAmmoTypeAsString()),

          new SizedBox(width: 5.0),

          new Image.asset(                  
            widget._mgunData.fgetAmmoTypeIconURI(),
            width: 20, height: 20
          )
        ],
      )
    );
  }
}