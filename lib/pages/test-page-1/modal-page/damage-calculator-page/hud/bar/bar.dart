import "package:flutter/material.dart";
import 'package:game_stats_app/pages/test-page-1/modal-page/damage-calculator-page/hud/bar/single_bar.dart';

class WBar extends StatefulWidget {
  WBar(
    this._mmaxBarCount, this._mcurBarCount, this._mcurValue, 
    this._mmaxValue, this._mcolor
  );

  @override
  _WBarState createState() => new _WBarState();

  final int _mmaxBarCount;
  final int _mcurBarCount;
  final double _mcurValue;
  final double _mmaxValue;  
  final Color _mcolor;
}

class _WBarState extends State<WBar> {
  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(      
      builder: (_, constraints) {
        int spaceCount = widget._mmaxBarCount - 1;
        double spaceWidth = 5.0;
        double totalSpaceWidth = spaceWidth * spaceCount;
        
        double remainingWidth = constraints.maxWidth - totalSpaceWidth;
        double barWidth = remainingWidth / widget._mmaxBarCount;
        
        double perBarValue = widget._mmaxValue / widget._mcurBarCount;
        double remainingValue = widget._mcurValue;

        List<Widget> rowItems = [];
        for(int i = 0; i < widget._mcurBarCount; i++) {
          double barValue = 0.0;

          if(remainingValue <= perBarValue)
            barValue = remainingValue;            
          else 
            barValue = perBarValue;          

          remainingValue -= barValue;


          rowItems.add(
            new WSingleBar(barValue, perBarValue, barWidth, widget._mcolor)
          );
          rowItems.add(new SizedBox(width: spaceWidth));
        }
        rowItems.removeLast();

        return new Row(children: rowItems);
      }
    );
  }  
}