import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      showPerformanceOverlay: true,
//      checkerboardRasterCacheImages: true,
      title: 'Click Test',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Scroll Test'),
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
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: <Widget>[
          new Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed "
              "do eiusmodtempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam,quis nostrud exercitation ullamco "
              "laboris nisi ut aliquip ex ea commodoconsequat. Duis aute "
              "irure dolor in reprehenderit in voluptate velit essecillum dolore "
              "eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed "
              "do eiusmodtempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam,quis nostrud exercitation ullamco "
              "laboris nisi ut aliquip ex ea commodoconsequat. Duis aute "
              "irure dolor in reprehenderit in voluptate velit essecillum dolore "
              "eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed "
              "do eiusmodtempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam,quis nostrud exercitation ullamco "
              "laboris nisi ut aliquip ex ea commodoconsequat. Duis aute "
              "irure dolor in reprehenderit in voluptate velit essecillum dolore "
              "eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed "
              "do eiusmodtempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam,quis nostrud exercitation ullamco "
              "laboris nisi ut aliquip ex ea commodoconsequat. Duis aute "
              "irure dolor in reprehenderit in voluptate velit essecillum dolore "
              "eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed "
              "do eiusmodtempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam,quis nostrud exercitation ullamco "
              "laboris nisi ut aliquip ex ea commodoconsequat. Duis aute "
              "irure dolor in reprehenderit in voluptate velit essecillum dolore "
              "eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum."),

        ],
      ),
    );
  }
}