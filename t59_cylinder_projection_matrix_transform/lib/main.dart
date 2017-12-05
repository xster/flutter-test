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
  double modelScale = 1.0;
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
                  child: new Transform(
                    transform: _getNewTransform(),
                    alignment: Alignment.center,
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
                          '5\nABC',
                          textAlign: TextAlign.center,
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
                      max: 200.0,
                      onChanged: onCameraHeightChanged,
                    ),
                    const Text('Model scale'),
                    new Slider(
                      label: modelScale.toStringAsFixed(2),
                      value: modelScale,
                      min: 0.1,
                      max: 20.0,
                      onChanged: onModelScaleChanged,
                    ),
                    const Text('Camera Angle'),
                    new Slider(
                      label: rotationAngle.toStringAsFixed(2),
                      value: rotationAngle,
                      min: -pi / 2.0,
                      max: pi / 2.0,
                      onChanged: onRotationAngleChanged,
                    ),
                    new RaisedButton(
                      child: const Text('Reset'),
                      onPressed: () {
                        setState(() {
                          cameraHeight = 1.0;
                          modelScale = 1.0;
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
  void onModelScaleChanged(double value) {
    setState(() {
      modelScale = value;
    });
  }

  void onRotationAngleChanged(double value) {
    setState(() {
      rotationAngle= value;
    });
  }

  Matrix4 _getNewTransform() {
    var cameraPosition = new Math.Vector3(0.0, cameraHeight * sin(rotationAngle), cameraHeight * cos(rotationAngle));
    var cameraFocusPosition = new Math.Vector3(0.0, 0.0, 0.0);
    var cameraUp = new Math.Vector3(0.0, 1.0, 0.0);

    var projectionMatrix = Math.makePerspectiveMatrix(90.0 * (PI / 180.0), 1.0, 1.0, 1000.0);
    var viewMatrix = Math.makeViewMatrix(cameraPosition, cameraFocusPosition, cameraUp);

    var modelMatrix = new Matrix4.diagonal3Values(modelScale, modelScale, 1.0);
    return projectionMatrix * viewMatrix * modelMatrix;
  }
}