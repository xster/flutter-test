import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

const int MAX_ABS_PERSPECTIVE = 20;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'The Matrix 3D'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double rotation = 0.0;
  Matrix4 perspective = new Matrix4.identity();
  int counter = 0;

  AnimationController animation;
  String axis = 'Y';
  Offset startPoint;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..addListener(() {
        setState(() {
          rotation = -Curves.easeOut.transform(animation.value) * 8 * PI;
        });
      });
    rotation = 0.0;
  }

  void _spinZ() {
    axis = 'Z';
    animation.forward(from: 0.0);
  }

  void _spinY(DragEndDetails details) {
    // print('details: ${details.velocity.pixelsPerSecond.dx}');
    axis = 'Y';
    animation.forward(from: 0.0);
  }

  void _spinX(DragEndDetails details) {
    axis = 'X';
    animation.forward(from: 0.0);
  }

  // http://web.iitd.ac.in/~hegde/cad/lecture/L9_persproj.pdf
  // create perspective matrix
  Matrix4 _pmat(num pv) {
    return new Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.0001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = perspective.multiplied(axis == 'X'
        ? new Matrix4.rotationX(rotation / 4)
        : (axis == 'Y'
            ? new Matrix4.rotationY(rotation / 4)
            : new Matrix4.rotationZ(rotation / 4)));
    print(transform);
    return new Transform(
      transform: transform,
      alignment: FractionalOffset.center,
      child: new GestureDetector(
        onVerticalDragEnd: _spinX,
        onHorizontalDragEnd: _spinY,
        child: new Center(
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
            ),
            floatingActionButton: new FloatingActionButton(
              onPressed: _spinZ,
              tooltip: 'Spin',
              child: new Icon(Icons.replay),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FloatingActionButton(
                    onPressed: () => setState(() {
                      if (counter < MAX_ABS_PERSPECTIVE) {
                        perspective = _pmat(++counter);
                      }
                    }),
                    mini: true,
                    tooltip: 'Increment',
                    child: new Icon(Icons.arrow_upward),
                  ),
                  new Text(' '),
                  new Text("Perspective: $counter",
                    style: DefaultTextStyle.of(context).style.apply(
                        fontSizeFactor: 0.6 + (counter.abs() * .01))),
                  new Text(' '),
                  new FloatingActionButton(
                    onPressed: () => setState(() {
                      if (counter > -MAX_ABS_PERSPECTIVE) {
                        perspective = _pmat(--counter);
                      }
                    }),
                    mini: true,
                    tooltip: 'Decrement',
                    child: new Icon(Icons.arrow_downward),
                  ),
                ],
              ),
            )))));
  }
}
