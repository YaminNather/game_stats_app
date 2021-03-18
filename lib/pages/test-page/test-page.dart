
import "package:flutter/material.dart";
import 'package:game_stats_app/pages/test-page-1/test-page-1.dart';
import 'package:game_stats_app/pages/test-page/search-box/search-box.dart';

class WTestPage extends StatefulWidget {
  @override
  _WTestPageState createState() => _WTestPageState();
}

class _WTestPageState extends State<WTestPage> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new AppBar(title: new Text("Pick a game")),
        body: new Container(
          width: double.infinity, height: double.infinity,
          child: new Stack(
            children: <Widget>[
              _fbuildGameSelection(),
              
              _fbuildSearchOverlay()            
            ],
          )       
        ),
      ),
    );
  }

  Container _fbuildGameSelection() {
    
    String lfgetIconPath(String fileName) {
      return "lib/pages/test-page/game-icons/$fileName";
    }

    Map<String, String> gamesInfos = <String, String> {
      "Apex Legends" : lfgetIconPath("apex-legends.png"),
      "Call of Duty: Modern Warfare" : lfgetIconPath("call-of-duty-modern-warfare.png"),
      "Valorant" : lfgetIconPath("valorant.png"),
      "Hyperscape" : lfgetIconPath("hyperscape.png"),
      "Counter Strike: Global Offensive" : lfgetIconPath("csgo.png")
    };

    return new Container(
      width: double.infinity, height: double.infinity,
      child: new GridView.count(  
        padding: new EdgeInsets.symmetric(vertical: 50),
        physics: new BouncingScrollPhysics(parent: new ScrollPhysics()),
        crossAxisCount: 2, childAspectRatio: 3/4, mainAxisSpacing: 10.0, 
        crossAxisSpacing: 10.0, children: _fbuildSelectGameBtns(gamesInfos)        
      )
    );
  }

  Container _fbuildSearchOverlay() {
    return new Container(
      width: double.infinity,
      padding: new EdgeInsets.symmetric(horizontal: 10, vertical: 10),      
      child: new WSearchBox() 
    );
  }

  List<Widget> _fbuildSelectGameBtns(Map<String, String> info) {
    List<Widget> r = new List.filled(0, new Text(""), growable: true);
    
    // r.add(new SizedBox(height: 10));
    // r.add(new SizedBox(height: 10));

    info.forEach( (key, value) => r.add(new WSelectGameBtn(key, value)) );

    return r;
  }
}


class WSelectGameBtn extends StatelessWidget {
  WSelectGameBtn(this._mname, this._mlogo);

  @override
  Widget build(BuildContext buildContext) {
    return new InkWell(
      onTap: () { 
        Navigator.push( 
          buildContext, new MaterialPageRoute(builder: (_) => new WTestPage1()) 
        );
      },
      child: new GridTile(        
        child: new Column(     
          crossAxisAlignment: CrossAxisAlignment.start,       
          children: <Widget>[
            _fbuildTopPart(),

            new SizedBox(height: 30),

            _fbuildNameLabel(buildContext)
          ]
        ),          
      )
    );
  }

  Widget _fbuildTopPart() {
    return new Image(image: new AssetImage(_mlogo));    
  }

  Widget _fbuildNameLabel(BuildContext buildContext) {
    return new Text(" $_mname");
  }



  final String _mname;  
  final String _mlogo;
}