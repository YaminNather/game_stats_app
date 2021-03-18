import "package:flutter/material.dart";
import 'package:game_stats_app/docs/apex-legends/gun-data/guns-datas.dart';
import 'package:game_stats_app/models/apex-legends/gun-data.dart';
import 'package:game_stats_app/pages/test-page-1/modal-page/modal-page.dart';

class WTestPage1 extends StatefulWidget {
  @override
  _WTestPage1State createState() => _WTestPage1State();
}

class _WTestPage1State extends State<WTestPage1> {
  @override
  Widget build(BuildContext context) {    
    return new Scaffold(
      appBar: new AppBar(title: new Text("Apex Legends")),
      body: new GridView(
        physics: new BouncingScrollPhysics(parent: new ScrollPhysics()),
        padding: new EdgeInsets.all(5.0),                
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 5.0, crossAxisSpacing: 10.0
        ),
        children: GunsDatas.sfgetGunsDatasAsList().map((value) => new _WItem(value)).toList(),
      )
    );
  }
  
}






class _WItem extends StatelessWidget {
  _WItem(this._mgunData);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        showModalBottomSheet(       
          context: context, backgroundColor: Colors.transparent, 
          isScrollControlled: true,
          builder: (context) => new WModalPage(_mgunData)
        );
      },
      child: new GridTile(
        child: new Column(
          children: <Widget>[
            new Image.asset(_mgunData.fgetGunImageURI()),   

            new SizedBox(height: 10.0),

            _fbuildNameLbl()     
          ]
        )
      )
    );
  }

  Widget _fbuildNameLbl() {
    Color color = _mgunData.fgetColorFromGunData();

    return new Row(
      children: <Widget>[
        new Transform.translate(
          offset: new Offset(5.0, 0.0),
          child: new Container(
            width: 32.0, height: 32.0,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(200),
              border: new Border.all(width: 2.0, color: color)
            ),
            child: new FractionallySizedBox(
              heightFactor: 60/100, widthFactor: 60/100,
              child: new Image.asset(_mgunData.fgetAmmoTypeIconURI()),
            )
          ),
        ),        
      
        new Expanded(
          flex: 1,
          child: new Container(
            width: double.infinity, color: color,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0), alignment: Alignment.centerLeft, 
            child: new Text(_mgunData.mname)
          ),
        )
      ]
    );
  }

  


  final GunData _mgunData;
}
