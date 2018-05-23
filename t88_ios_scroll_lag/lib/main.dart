import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100.0,
              width: 200.0,
              margin: const EdgeInsets.all(12.0),
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}