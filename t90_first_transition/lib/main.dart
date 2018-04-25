import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 4.0;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(depth: 1),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.depth}) : super(key: key);

  final int depth;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.depth.toString()),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: const Text('We must go deeper'),
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new RepaintBoundary(
                        child: new MyHomePage(
                          depth: widget.depth + 1,
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
