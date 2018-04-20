import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Container(
          width: 250.0,
          height: 140.0,
          decoration: BoxDecoration(
            border: new Border.all(
              color: Colors.black,
              width: 2.0)),
          child: Container(
            decoration: FlutterLogoDecoration(
              style: FlutterLogoStyle.horizontal)))));
  }
}
