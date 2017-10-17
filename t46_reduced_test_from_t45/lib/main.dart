import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        body: new Scaffold(
          // resizeToAvoidBottomPadding: false, <<== fix with
          body: new ListView.builder(
            itemCount: 40,
            itemExtent: 50.0,
            itemBuilder: (BuildContext context, int index) {
              return new TextField(
                decoration: new InputDecoration(
                  hintText: index.toString(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
