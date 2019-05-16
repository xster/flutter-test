import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const channel = MethodChannel('switch');

class MySwitch extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool switchValue = false;

  @override
  void initState() {
    super.initState();

    channel.setMethodCallHandler((MethodCall call) {
      if (call.method != 'send') {
        throw UnimplementedError();
      }

      if (call.arguments is! bool) {
        throw ArgumentError();
      }

      print('dart received switch ${call.arguments}');

      setState(() => switchValue = call.arguments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Switch.adaptive(
          value: switchValue,
          onChanged: (value) {
            print('dart sending switch $value');
            channel.invokeMethod('return', value);
            setState(() => switchValue = value);
          },
        ),
      ),
    );
  }
}
