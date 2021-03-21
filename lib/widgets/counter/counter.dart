import 'dart:math';

import "package:flutter/material.dart";

class WCounter extends StatefulWidget {
  WCounter(
    this._minitialValue, 
    {
      this.mwidth, this.mheight, this.mlowerRange, this.mupperRange,
      this.mfonChange
    }
  );    

  @override
  _WCounterState createState() => _WCounterState();

  final double mwidth;
  final double mheight;
  final int _minitialValue;
  final int mlowerRange;
  final int mupperRange;
  final Function(int value) mfonChange;
}

class _WCounterState extends State<WCounter> {
  @override
  void initState() {
    super.initState();

    _mvalue = widget._minitialValue;
    if(widget.mlowerRange != null && _mvalue < widget.mlowerRange)
      _mvalue = widget.mlowerRange;
    
    if(widget.mupperRange != null && _mvalue > widget.mupperRange)
      _mvalue = widget.mupperRange;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return new Stack(
      alignment: Alignment.center,
      children: [
        new Container(
          width: widget.mwidth, height: widget.mheight,
          // padding: new EdgeInsets.symmetric(horizontal: 10.0),
          decoration: _mcircleBoxDecoration.copyWith(color: theme.cardColor),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,            
            children: <Widget>[
              _fbuildBtn(Icons.remove, () => _fsetValue(_mvalue - 1)),       

              _fbuildBtn(Icons.add_outlined, () => _fsetValue(_mvalue + 1))
            ]
          )
        ),

        new Container(
          width: widget.mwidth, height: widget.mheight, 
          alignment: Alignment.center, child: _fbuildCountDisplay()
        )
      ],
    );
  }

  Widget _fbuildCountDisplay() {
    ThemeData theme = Theme.of(context);

    Duration animDur = new Duration(milliseconds: 100);

    return new LayoutBuilder(
      builder: (_, constraints) {
        double diameter = constraints.maxHeight;
        print("Diameter = $diameter");         
        
        return new AnimatedContainer(
          width: diameter, height: diameter,          
          decoration: _mcircleBoxDecoration.copyWith(
            color: theme.cardColor, 
            boxShadow: [
              new BoxShadow(blurRadius: 2, offset: new Offset(1, 1))
            ]
          ),
          alignment: Alignment.center,
          transform: new Matrix4.identity()..translate(
            ((_mtoAnimate) ? 10.0 : 0.0) * _mmoveDir
          ),
          duration: _manimDur,
          onEnd: () => setState(() => _mtoAnimate = false),
          child: new AnimatedDefaultTextStyle(
            duration: animDur,
            style: new TextStyle(
              fontSize: diameter * 0.5 * ((_mtoAnimate) ? 1.3 : 1.0)
            ),
            child: new Text("$_mvalue")                    
          )
        );
      }
    );
  }

  Widget _fbuildBtn(IconData iconData, void Function() onPress) {
    return new MaterialButton(
      child: new Icon(iconData), onPressed: onPress,
      shape: new CircleBorder()
    );
  }

  void _fsetValue(int value) {
    if(widget.mlowerRange != null && value < widget.mlowerRange)
      value = widget.mlowerRange;        

    if(widget.mupperRange != null && value > widget.mupperRange)
      value = widget.mupperRange;

    if(value == _mvalue)
      return;

    
    if(widget.mfonChange != null)
      widget.mfonChange(value);

    setState(
      () {
        _mtoAnimate = true;

        if(value < _mvalue)
          _mmoveDir = -1;
        else      
          _mmoveDir = 1;

        _mvalue = value;
      }
    );
  }



  int _mvalue = 0;
  bool _mtoAnimate = false;
  int _mmoveDir = 1;


  final Duration _manimDur = new Duration(milliseconds: 100);
  final BoxDecoration _mcircleBoxDecoration = new BoxDecoration(
    borderRadius: new BorderRadius.circular(1000.0)
  );
}


class SineCurve extends Curve {
  @override
  double transformInternal(double t) {
    return sin(t * pi);
  }
}