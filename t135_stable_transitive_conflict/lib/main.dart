import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<AndroidDeviceInfo> deviceInfoFuture;

  @override
  void initState() {
    super.initState();
    deviceInfoFuture  = DeviceInfoPlugin().androidInfo;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: FutureBuilder<AndroidDeviceInfo>(
          future: deviceInfoFuture,
          builder: (BuildContext context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
            print(snapshot.data);
            if (snapshot?.data?.model == null)
              return Text('retrieving...');
            else
              return Text(snapshot.data.model);
          },
        ),
      ),
    );
  }
}
