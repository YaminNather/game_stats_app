import "package:flutter/material.dart";
import 'package:game_stats_app/models/apex-legends/gun-data.dart';
import 'package:game_stats_app/pages/test-page-1/modal-page/weapon-info-display-page/base-stats/growing-bar/growing-bar.dart';

class WBaseStats extends StatelessWidget {
  WBaseStats(this._mgunData);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return new Card(
      elevation: 2.0,
      child: new Container(
        width: double.infinity,
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text("   Base Stats", style: textTheme.headline5),
            
            new Divider(color: Colors.white60),

            lfbuildStats()    
          ],
        )
      )
    );
  }

  Widget lfbuildStats() {
    List<Widget> stats = [];

    List<List<dynamic>> data = [
      ["TTK", 100], ["DPS", 70], ["Ammo", 30], ["Range", 50], ["Velocity", 20]
    ];

    for(List<dynamic> d in data)
      stats.add(new WGrowingBar(d[0], d[1], _mgunData.fgetColorFromGunData()));      

    return new Column(children: stats);
  }

  final GunData _mgunData;
}