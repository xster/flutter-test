import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  home: new Scaffold(
    appBar: new AppBar(
     title: const Text('List Wheel Demo'),
    ),
    body: new ListWheelDemo(),
  ),
));

class ListWheelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ListWheelDemoState();
}

class ListWheelDemoState extends State<ListWheelDemo> {
  double _diameterRatio = 2.0;
  double _perspective = 0.001;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new Container(
            height: 200.0,
            decoration: const BoxDecoration(
              border: const Border(
                  top: const BorderSide(width: 1.0),
                  bottom: const BorderSide(width: 1.0),
              ),
            ),
            child: new ListWheelScrollView(
              diameterRatio: _diameterRatio,
              perspective: _perspective,
              clipToSize: false,
              renderChildrenOutsideViewport: true,
              itemExtent: 50.0,
              children: new List<Widget>.generate(20, (int index) {
                return new Container(
                  height: 60.0,
                  width: 200.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.yellow, width: 0.5),
                    color: Colors.red,
                  ),
                  child: new Center(
                    child: new Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        new Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Diameter'),
              new Slider(
                min: 0.5,
                max: 40.0,
                value: _diameterRatio,
                label: _diameterRatio.toStringAsFixed(2),
                onChanged: (double value) => setState(() { _diameterRatio = value; }),
              ),
              const Text('Perspective'),
              new Slider(
                min: 0.0001,
                max: 0.01,
                value: _perspective,
                label: _perspective.toStringAsFixed(3),
                onChanged: (double value) => setState(() { _perspective = value; }),
              ),
              const Padding(padding: const EdgeInsets.only(bottom: 60.0)),
            ],
          ),
        ),
      ],
    );
  }
}
