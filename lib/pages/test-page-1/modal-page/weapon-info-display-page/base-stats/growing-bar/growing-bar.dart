import 'dart:async';

import "package:flutter/material.dart";

class WGrowingBar extends StatefulWidget {
  WGrowingBar(this._mname, this._mpercentage, this._mcolor);

  @override
  _WGrowingBarState createState() => _WGrowingBarState();


  final String _mname;
  final int _mpercentage;
  final Color _mcolor;
}

class _WGrowingBarState extends State<WGrowingBar> {
  @override
  void initState() {
    super.initState();

    new Timer(
      new Duration(seconds: 0),
      () => setState(() {_mwidthMultiplier = widget._mpercentage / 100;})
    );
  }

  @override
  Widget build(BuildContext context) {
    var headingFlex = 20;

    return new Container(
      width: double.infinity,
      margin: new EdgeInsets.only(top: 20.0),
      child: new Row(        
        children: [
          new Expanded(
            flex: headingFlex,
            child: new Text(widget._mname, textAlign: TextAlign.right)
          ),

          new SizedBox(width: 10.0),

          new Expanded(
            flex: 80, 
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new LayoutBuilder(
                builder: (_, constraints) {
                  return new AnimatedContainer(
                    width: _mwidthMultiplier * constraints.maxWidth, height: 40.0, 
                    duration: new Duration(seconds: 1), color: widget._mcolor, 
                    curve: Curves.easeOut,
                  );
                },
              )
            )
          )
        ],
      )    
    );
  }



  double _mwidthMultiplier = 0.0;
}