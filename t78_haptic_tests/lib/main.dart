import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(title: const Text('Haptic Tests')),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: const Text('Basic'),
              onPressed: () => HapticFeedback.vibrate()),
            new RaisedButton(
              child: const Text('Light impact'),
              onPressed: () => HapticFeedback.lightImpact()),
            new RaisedButton(
              child: const Text('Medium impact'),
              onPressed: () => HapticFeedback.mediumImpact()),
            new RaisedButton(
              child: const Text('Heavy impact'),
              onPressed: () => HapticFeedback.heavyImpact()),
            new RaisedButton(
              child: const Text('Selection click'),
              onPressed: () => HapticFeedback.selectionClick()),
          ])));
  }
}
