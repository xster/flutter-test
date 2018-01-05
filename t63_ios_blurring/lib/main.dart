import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        body: new Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            new Image.network('http://images.all-free-download.com/images/graphicthumb/abstract_backgrounds_pattern_537131.jpg'),
            new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                 child: new Container(
                   height: 150.0,
                   width: 150.0,
                   color: const Color(0x88000000),
                 ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
