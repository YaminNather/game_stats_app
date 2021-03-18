import "package:flutter/material.dart";


class WSearchBox extends StatefulWidget {
  @override
  _WSearchBoxState createState() => _WSearchBoxState();
}

class _WSearchBoxState extends State<WSearchBox> {
  @override
  void initState() {
    super.initState();

    _mfocusNode.addListener( () => setState(() {}) );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity, height: 50.0, padding: new EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: new BorderRadius.circular(2),
        boxShadow: <BoxShadow>[new BoxShadow(blurRadius: 10.0)]        
      ),
      child: new Row(        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new _WSearchIcon(_mfocusNode.hasFocus),

          new Expanded(            
            flex: 1,
            child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: new TextField(      
                focusNode: _mfocusNode,     
                decoration: new InputDecoration(border: InputBorder.none)                      
              )
            )
          ),

          new IconButton(icon: new Icon(Icons.menu), onPressed: () => print("Pressed"))
        ]
      )
    );
  }


  FocusNode _mfocusNode = new FocusNode();
}

class _WSearchIcon extends StatelessWidget {
  _WSearchIcon(this._misInFocus);

  @override
  Widget build(BuildContext context) {
    double searchOpacity = 1;    

    if(_misInFocus)
      searchOpacity = 0;          

    return new Stack(
      children: <Widget>[
        new AnimatedOpacity(
          opacity: searchOpacity, duration: new Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: new Icon(Icons.search, size: 30.0)
        ),

      new AnimatedOpacity(
        opacity: 1 - searchOpacity, duration: new Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: new Icon(Icons.arrow_back, size: 30.0)
      )
      ],
    );
  }

  final bool _misInFocus;
}