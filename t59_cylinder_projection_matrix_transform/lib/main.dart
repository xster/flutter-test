import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as Math;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '3D Transform',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: '3D Transform'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double cameraHeight = 1.0;
  double cylinderRadius = 0.0;
  double rotationAngle = 0.0;

  _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Center(
                  child: new RepaintBoundary(
                    child: new Transform(
                      // transform: new Matrix4.rotationX(rotationAngle),
                      transform: _getNewTransform(),
                      // transform: new Matrix4.identity(),
                      alignment: Alignment.center,
                      child: new RepaintBoundary(
                        child: new Container(
                          width: 200.0,
                          height: 150.0,
                          decoration: const BoxDecoration(
                            gradient: const LinearGradient(
                              colors: const <Color>[
                                Colors.blue, Colors.red,
                              ],
                            ),
                          ),
                          child: new Center(
                            child: const Text(
                              '5',
                              style: const TextStyle(
                                fontSize: 60.0,
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Camera Height (view z)'),
                    new Slider(
                      label: cameraHeight.toStringAsFixed(2),
                      value: cameraHeight,
                      min: 0.0,
                      max: 100.0,
                      onChanged: onCameraHeightChanged
                    ),
                    const Text('Cylinder Radius (model z)'),
                    new Slider(
                      label: cylinderRadius.toStringAsFixed(2),
                      value: cylinderRadius,
                      min: -10.0, max: 10.0,
                      onChanged: onCylinderRadiusChanged
                    ),
                    const Text('Rotation Angle (model rotation)'),
                    new Slider(
                      label: rotationAngle.toStringAsFixed(2),
                      value: rotationAngle,
                      min: -pi / 2.0,
                      max: pi / 2.0,
                      onChanged: onRotationAngleChanged
                    ),
                    new RaisedButton(
                      child: const Text('Reset'),
                      onPressed: () {
                        setState(() {
                          cameraHeight = 1.0;
                          cylinderRadius = 0.0;
                          rotationAngle = 0.0;
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCameraHeightChanged(double value) {
    setState(() {
      cameraHeight = value;
    });
  }
  void onCylinderRadiusChanged(double value) {
    setState(() {
      cylinderRadius = value;
    });
  }

  void onRotationAngleChanged(double value) {
    setState(() {
      rotationAngle= value;
    });
  }

  Matrix4 _getNewTransform() {
    var cameraPosition = new Math.Vector3(0.0, 0.0, cameraHeight);// - cylinderRadius);
    var cameraFocusPosition = new Math.Vector3(0.0, 0.0, 0.0);
    var cameraUp = new Math.Vector3(0.0, 1.0, 0.0);

    var projectionMatrix = Math.makePerspectiveMatrix(100.0 * (PI / 180.0), 1.0, 1.0, 1000.0);
    var viewMatrix = Math.makeViewMatrix(cameraPosition, cameraFocusPosition, cameraUp);

    var modelMatrix = new Matrix4.rotationX(rotationAngle) * new Matrix4.translationValues(0.0, 0.0, cylinderRadius);//new Matrix4.translationValues(0.0, 0.0, -cylinderRadius) *
    return projectionMatrix * viewMatrix * modelMatrix;
  }
}