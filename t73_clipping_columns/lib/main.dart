import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        body: new Center(
          child: new DecoratedBox(
            decoration: new BoxDecoration(
              color: Colors.blue,
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: new Container(
              width: 100.0,
              height: 300.0,
              color: Colors.red.withAlpha(80),
            ),
          ),
        ),
      ),
    );
  }
}
