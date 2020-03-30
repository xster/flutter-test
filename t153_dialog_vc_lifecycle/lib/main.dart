import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
    MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
      ),
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  _launchURL() async {
    const url = 'tel://9000000';
    if (await canLaunch(url)) {
      // This uses url launcher plugin to display an overlay.
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('changed to state $state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
          child: FlatButton(
            child: Text("A long launch URL"),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            onPressed: _launchURL,
          )
      ),
    );
  }
}