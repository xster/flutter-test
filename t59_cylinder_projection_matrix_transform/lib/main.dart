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
  PageController pageController;
  bool alternateMode = false;

  double cameraHeight = 2.0;
  double modelRadius = 1.0;
  double rotationAngle = 0.0;

  double perspectiveProjection = 0.0;

  _MyHomePageState();

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: 0);
  }

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
                  child: buildTargetWidget(),
                ),
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Perspective View Model'),
                  new Switch(
                    value: alternateMode,
                    onChanged: (bool value) {
                      setState(() {
                        alternateMode = value;
                        pageController.jumpToPage(value ? 1 : 0);
                      });
                    },
                  ),
                  const Text('Perspective Projection'),
                ],
              ),
              new LimitedBox(
                maxHeight: 350.0,
                child: new PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildPVMControlPanel(),
                    buildPerspectiveMatrixControlPanel(),
                  ],
                ),
              ),
              new RaisedButton(
                child: const Text('Reset'),
                onPressed: () {
                  setState(() {
                    cameraHeight = 1.0;
                    modelRadius = 1.0;
                    rotationAngle = 0.0;

                    perspectiveProjection = 0.0;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTargetWidget() {
    return new Stack(
      children: <Widget>[
        new Container(
          width: 200.0,
          height: 150.0,
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.green),
          ),
        ),
        new Transform(
          transform: alternateMode ? getPerspectiveProjectionTransform() : getPVMTransform(),
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
      ],
    );
  }

  Widget buildPVMControlPanel() {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Camera Height (view z)'),
          new Slider(
            label: cameraHeight.toStringAsFixed(2),
            value: cameraHeight,
            min: 0.0,
            max: 1000.0,
            onChanged: (double value) { setState(() { cameraHeight = value; }); },
          ),
          const Text('Model radius'),
          new Slider(
            label: modelRadius.toStringAsFixed(2),
            value: modelRadius,
            min: -1000.0,
            max: 1000.0,
            onChanged: (double value) { setState(() { modelRadius = value; }); },
          ),
          const Text('Camera Angle'),
          new Slider(
            label: rotationAngle.toStringAsFixed(2),
            value: rotationAngle,
            min: -pi / 2.0,
            max: pi / 2.0,
            onChanged: (double value) { setState(() { rotationAngle = value; }); },
          ),
          const Text('Perspective projection'),
          new Slider(
            label: perspectiveProjection.toStringAsFixed(2),
            value: perspectiveProjection,
            min: 0.0,
            max: 0.01,
            onChanged: (double value) { setState(() { perspectiveProjection = value; }); },
          ),
        ],
      ),
    );
  }

  Widget buildPerspectiveMatrixControlPanel() {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Perspective projection'),
          new Slider(
            label: perspectiveProjection.toStringAsFixed(2),
            value: perspectiveProjection,
            min: 0.0,
            max: 0.01,
            onChanged: (double value) { setState(() { perspectiveProjection = value; }); },
          ),
          const Text('Rotation Angle'),
          new Slider(
            label: rotationAngle.toStringAsFixed(2),
            value: rotationAngle,
            min: -pi / 2.0,
            max: pi / 2.0,
            onChanged: (double value) { setState(() { rotationAngle = value; }); },
          ),
        ],
      ),
    );
  }

  Matrix4 getPerspectiveProjectionTransform() {
    final Matrix4 transformation = (new Matrix4.identity()
        ..setEntry(3, 2, perspectiveProjection)) * new Matrix4.rotationX(rotationAngle);

    return transformation;
  }

  Matrix4 getPVMTransform() {
    var cameraPosition = new Math.Vector3(0.0, 0.0, cameraHeight);
    var cameraFocusPosition = new Math.Vector3(0.0, 0.0, 0.0);
    var cameraUp = new Math.Vector3(0.0, 1.0, 0.0);

    var projectionMatrix = Math.makePerspectiveMatrix(90.0 * (PI / 180.0), 1.0, 1.0, 1000.0);
    print(projectionMatrix);
    projectionMatrix = new Matrix4.identity()
        ..setEntry(3, 2, -perspectiveProjection);
    print(projectionMatrix);
    var viewMatrix = Math.makeViewMatrix(cameraPosition, cameraFocusPosition, cameraUp);

    var modelMatrix = new Matrix4.rotationX(rotationAngle) * new Matrix4.translationValues(0.0, 0.0, modelRadius);
    return projectionMatrix * viewMatrix * modelMatrix;
  }
}