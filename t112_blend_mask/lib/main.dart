import 'dart:math' show Random;

import 'package:flutter/material.dart';

Random random = Random();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Color topColor;

  @override
  void initState() {
    super.initState();
    randomColor();
  }

  void randomColor() {
    topColor = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Color(0xFFFF0000),
          ),
          Padding(
            padding: EdgeInsets.all(50.0),
            child: RepaintBoundary(
              child: Container(
                color: topColor,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.dstOut,
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFFFFFFF),
                        Color(0x00FFFFFF),
                      ],
                      stops: <double>[
                        0.0,
                        1.0,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    // color: Color(0x50000000),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Container(
                      color: topColor,
                      child: Center(
                        child: RaisedButton(
                          child: Text('Random Color'),
                          onPressed: () => setState(() => randomColor()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
