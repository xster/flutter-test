import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('iOS Swipe Demo')),
        body: new Center(
            child: new FlatButton(
          child: new Text('PRESS ME'),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: new RouteSettings(),
                  builder: (BuildContext context) {
                    return new Container(color: Colors.blue);
                  },
                ));
          },
        )));
  }
}