import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
        // Notice that the counter didn't reset back to zero -- the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Screen1Widget(),
    );
  }
}

class Screen1Widget extends StatefulWidget {
  @override
  createState() => new _Screen1State();
}

class _Screen1State extends State<Screen1Widget> {
  bool slowTime = false;
  bool modal = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Screen 1')),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                new Text('Slow down time'),
                new Checkbox(
                  value: slowTime,
                  onChanged: (bool to) {
                    setState(() {
                      slowTime = to;
                      timeDilation = to ? 5.0 : 1.0;
                    });
                  },
                ),
              ],
            ),
            new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                new Text('Dialog'),
                new Checkbox(
                  value: modal,
                  onChanged: (bool to) {
                    setState(() {
                      modal = to;
                    });
                  }
                ),
              ],
            ),
            new RaisedButton(
              child: new Text('Next Screen'),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  fullscreenDialog: modal,
                  builder: (BuildContext context) {
                    return new Screen2Widget();
                  },
                ));
              },
            ),
          ],
        ),
      )
    );
  }
}

class Screen2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Screen 2')),
      body: new Center(child: new RaisedButton(
        child: new Text('Next Screen'),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) {
              return new Screen3Widget();
            },
          ));
        },
      ),),
    );
  }
}

class Screen3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Screen 3')),
      body: new Center(child: new Text('Screen 3')),
    );
  }
}
