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
        body: new Column(
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
          ],
        ),
      ),
    );
  }
}

