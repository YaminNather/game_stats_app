import "package:flutter/material.dart";

class WSingleBar extends StatefulWidget {
  WSingleBar(
    this._mcurValue, this._mmaxValue, this._mwidth, this._mcolor
  );

  @override
  _WSingleBarState createState() => _WSingleBarState();

  double _mwidth;
  Color _mcolor;
  double _mcurValue;
  double _mmaxValue;
}

class _WSingleBarState extends State<WSingleBar> {
  @override
  Widget build(BuildContext context) {
    return new Stack(      
      children: <Widget>[
        new Container(width: widget._mwidth, height: 20.0, color: Colors.grey),

        new Container(
          width: widget._mwidth * (widget._mcurValue / widget._mmaxValue),
          height: 20.0, color: widget._mcolor
        )
      ],
    );
  }
}