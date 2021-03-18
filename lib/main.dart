import 'package:flutter/material.dart';
import 'package:game_stats_app/pages/test-page/test-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = new ThemeData(
      brightness: Brightness.dark, 
      scaffoldBackgroundColor: new Color.fromRGBO(10, 10, 10, 1.0)
    );

    return new MaterialApp(
      title: 'Flutter Demo', theme: theme, 
      routes: <String, Widget Function(BuildContext)> {
        "/Home" : (buildContext) => new WTestPage(),        
      }, initialRoute: "/Home"
    );
  }
}
