import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Text transform test',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Text transform test'),
        ),
        body: new ListView(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Text as is'),
                const Text('Test text'),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Translated'),
                new Transform(
                  transform: new Matrix4.translationValues(-50.0, 0.0, 0.0),
                  child: const Text('Test text'),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Rotated Z'),
                new Transform(
                  transform: new Matrix4.rotationZ(1.0),
                  child: const Text('Test text'),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Rotated X'),
                new Transform(
                  transform: new Matrix4.rotationX(1.0),
                  child: const Text('Test text'),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Scale'),
                new Transform(
                  transform: new Matrix4.diagonal3Values(1.5, 1.5, 1.0),
                  child: const Text('Test text'),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Perspective'),
                new Transform(
                  transform: MatrixUtils.createCylindricalProjectionTransform(
                    angle: -0.7,
                    perspective: 0.01,
                    radius: 100.0,
                    orientation: Axis.horizontal,
                  ),
                  child: const Text('Test text'),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Perspective in a box'),
                new Transform(
                  transform: MatrixUtils.createCylindricalProjectionTransform(
                    angle: -0.7,
                    perspective: 0.01,
                    radius: 100.0,
                    orientation: Axis.horizontal,
                  ),
                  child: new Container(
                    color: Colors.green,
                    child: const Text('Test text'),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Wheel'),
                new SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: new ListWheelScrollView(
                    itemExtent: 40.0,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Wheel with text in box'),
                new SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: new ListWheelScrollView(
                    itemExtent: 40.0,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                        child: const Text('test')),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                        child: const Text('test')),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                        child: const Text('test')),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                        child: const Text('test')),
                      new Container(
                        width: 150.0,
                        color: Colors.purple,
                        child: const Text('test')),
                    ],
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Transformed text'),
                new Transform(
                  transform: new Matrix4(
                    1.0, 0.0, 0.0, 0.0,
                    0.12202099292274005, 1.0355664505653408, -0.40673664307580015, 0.0012202099292274004,
                    -0.27406363729278027, 0.13267300578301988, 0.9135454576426009, -0.0027406363729278026,
                    -7.014826750830039, 82.97795610006989, 23.382755836100173, 0.9298517324916995,
                  ),
                  child: new Container(
                    width: 150.0,
                    color: Colors.red,
                    child: const Text('test'),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Wheel with text'),
                new SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: new ListWheelScrollView(
                    itemExtent: 40.0,
                    children: <Widget>[
                      const Text('1'),
                      const Text('2'),
                      const Text('3'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

