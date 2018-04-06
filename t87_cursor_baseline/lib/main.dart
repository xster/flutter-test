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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new TextField(
                style: const TextStyle(
                  fontFamily: 'FuturaMedium',
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 20.0)),
              new TextField(
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 20.0)),
              new TextField(
                style: const TextStyle(
                  fontFamily: 'Noto Serif',
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
