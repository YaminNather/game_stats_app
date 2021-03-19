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

    List<StatData> data = <StatData>[
      new StatData("TTK", 100), new StatData("DPS", 70), 
      new StatData("Ammo", 30), new StatData("Range", 50), 
      new StatData("Velocity", 20)
    ];

    for(StatData d in data) {
      stats.add(
        new WGrowingBar(
          d._mname, d._mpercentage, _mgunData.fgetColorFromGunData()
        )
      );      
    }

    return new Column(children: stats);
  }

  final GunData _mgunData;
}

class StatData {
  StatData(this._mname, this._mpercentage);

  final String _mname;
  final int _mpercentage;
}