import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  debugPrintBeginFrameBanner = true;
  debugPrintEndFrameBanner = true;
  debugPrintScheduleFrameStacks = true;
  timeDilation = 2.0;
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
        // you ran "flutter run", or press Run > Hot Reload App in
        // IntelliJ). Notice that the counter didn't reset back to zero;
        // the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  Widget build(BuildContext context) {
    return new Material(
        child: new Center(
          child: new MaterialButton(
            onPressed: () {
              launch('http://www.flutter.io');
            },
            child: new Text(
                'THIS IS A MATERIAL BUTTON WITH LONG TEXT'
            ),
          ),
        ),
    );
  }
}
