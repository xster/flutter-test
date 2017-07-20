import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        body: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                  height: 30.0,
                  width: 30.0,
                  color: const Color(0xFF000000),
                ),
                new Container(
                  width: 20.0,
                  color: const Color(0xFF00FFFF),
                ),
                new Container(
                  height: 30.0,
                  width: 30.0,
                  color: const Color(0xFF000000),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
