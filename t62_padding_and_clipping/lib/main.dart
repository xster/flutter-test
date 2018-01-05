import 'package:flutter/material.dart';

void main() => runApp(new Test());

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:
      new Scaffold(
        body: new Center(
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(width: 1.0),
            ),
            height: 150.0,
            child: new Column(
              children: <Widget>[
                new Text(
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                  'this text is too long\n'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
