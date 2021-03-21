import "package:flutter/material.dart";
import 'package:game_stats_app/models/apex-legends/gun-data.dart';
import 'package:game_stats_app/pages/test-page-1/modal-page/damage-calculator-page/damage-calculator-page.dart';
import 'package:game_stats_app/pages/test-page-1/modal-page/weapon-info-display-page/weapon-info-display-page.dart';

class WModalPage extends StatelessWidget {
  WModalPage(this._mgunData);

  @override
  Widget build(BuildContext context) {
    return _fbuildContainer(context, _fbuildPageView());    
  }

  Widget _fbuildContainer(BuildContext context, Widget child) {
    return new Stack(
      children: [
        new FractionallySizedBox(
          heightFactor: 70/100,
          child: new Container(
            decoration: new BoxDecoration(              
              color: Theme.of(context).canvasColor,
              borderRadius: new BorderRadius.only(
                topLeft: new Radius.circular(10.0), 
                topRight: new Radius.circular(10.0)            
              )
            ),
            padding: new EdgeInsets.all(10.0),
            child: child
          )
        ),

        new Transform.translate(
          offset: new Offset(0.0, -150.0),
          child: new Image.asset(_mgunData.fgetGunImageURI())
        )
      ]
    );
  }

  Widget _fbuildPageView() {
    return new PageView(
      children: [
        new WWeaponInfoDisplayPage(_mgunData),
        
        new WDamageCalcPage(_mgunData)
      ],
    );
  }


  final GunData _mgunData;
}