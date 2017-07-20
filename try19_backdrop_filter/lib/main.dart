import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new ListView(children: new List<Widget>.filled(
              10,
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                child: new Card(
                  child: new SizedBox(
                    height: 160.0,
                    child: const Center(child: const Text('blah')),
                  )
                ),
              )
            )),
            new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child:
                  new Container(
                    height: 60.0,
                    padding: const EdgeInsets.only(top: 16.0),
                    decoration: const BoxDecoration(
                      color: const Color(0xAAF7F7F7),
                      border: const Border(
                        bottom: const BorderSide(color: const Color(0xAAEEEEEE)),
                      ),
                    ),
                    child: const Center(child: const Text('Title')),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
