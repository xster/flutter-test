import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text('Go back'),
            onPressed: () => SystemNavigator.pop()),
          Padding(padding: EdgeInsets.only(top: 16)),
          RaisedButton(
            child: Text('Next Flutter'),
            onPressed: () => AndroidApi().startAnotherFlutter()),
        ],
      ),
    );
  }
}
