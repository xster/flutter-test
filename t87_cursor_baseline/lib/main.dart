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
          child: new TextField(
            style: const TextStyle(
              fontFamily: 'FuturaMedium',
              color: Colors.black,
              fontSize: 40.0,
            ),
          ),
        ),
      )
    );
  }
}
