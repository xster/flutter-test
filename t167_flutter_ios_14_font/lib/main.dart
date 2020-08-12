import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(child: Center(
        child: Text(
          'Default system 17 font',
          style: TextStyle(
            fontFamily: '.SFUI-Regular',
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.36
          ),
        ),
      )),
    );
  }
}
