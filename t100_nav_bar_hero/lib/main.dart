import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
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
  double lerpProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Page 1'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CupertinoNavigationBar.lerp(
                  CupertinoNavigationBar(
                    middle: Text('Page one'),
                  ),
                  CupertinoNavigationBar(
                    middle: Text('Page two'),
                  ),
                  lerpProgress,
                ),
                CupertinoSlider(
                  min: 0.0,
                  max: 1.0,
                  value: lerpProgress,
                  onChanged: (double value) => setState(() => lerpProgress = value),
                ),
              ],
            ),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text('Next'),
              onPressed: () => Navigator.push(context, CupertinoPageRoute(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text('Page 2'),
                    ),
                    child: Placeholder(),
                  );
                }
              )),
            ),
          ],
        ),
      ),
    );
  }
}
