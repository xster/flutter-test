import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String device = 'Retrieving';

  @override
  void initState() {
    super.initState();
    DeviceInfoPlugin().androidInfo.then((deviceInfo) {
      setState(() {
        device = deviceInfo.manufacturer;
      });
    }).catchError((onError) {
      setState(() {
        device = 'Error';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Center(
        child: Text(device),
      ),
    );
  }
}
