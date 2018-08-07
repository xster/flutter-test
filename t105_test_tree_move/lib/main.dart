import 'package:flutter/material.dart';

void main() => runApp(Directionality(
  textDirection: TextDirection.ltr,
  child: TestApp(),
));

class TestApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TestAppState();
}

class TestAppState extends State<TestApp> {
  Widget constantSubtree;
  bool shiftTree;

  @override
  void initState() {
    super.initState();
    shiftTree = false;
    constantSubtree = Container(
      height: 150.0,
      width: 150.0,
      color: Colors.red,
      child: Container(
        key: GlobalKey(),
        height: 100.0,
        width: 100.0,
        color: Colors.red,
        child: Container(
          height: 50.0,
          width: 50.0,
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget moveTree = Row(
      children: <Widget>[
        Container(
          height: 200.0,
          width: 200.0,
          color: Colors.white,
          child: shiftTree ? constantSubtree : null,
        ),
        Container(
          height: 200.0,
          width: 200.0,
          color: Colors.pink,
          child: shiftTree ? null : constantSubtree,
        ),
      ],
    );
      constantSubtree;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          moveTree,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: RaisedButton(
              child: Text('Shift'),
              onPressed: () { setState(() { shiftTree = !shiftTree; }); },
            ),
          )
        ],
      ),
    );
  }
}
