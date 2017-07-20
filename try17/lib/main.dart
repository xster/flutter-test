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
      home: new Center(
        child: new GestureDetector(
          onTap: () { print('tapped'); },
          child: new Center(
            child: new Text('Center'),
          ),
        ),
      ),
    );
  }
}

