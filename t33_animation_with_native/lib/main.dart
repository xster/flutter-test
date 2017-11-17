import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

const platformChannel = const MethodChannel('t33.test.flutter.io/native');

void main() {
  runApp(new MaterialApp(
    home: new AnimationTester(),
    theme: new ThemeData(platform: TargetPlatform.iOS),
  ));
}

class AnimationTester extends StatefulWidget {
  @override
  AnimationTesterState createState() => new AnimationTesterState();
}

class AnimationTesterState extends State<AnimationTester> with SingleTickerProviderStateMixin {
  AnimationController controller;

  FractionalOffsetTween positionTween = new FractionalOffsetTween(
    begin: const FractionalOffset(0.0, 0.2),
    end: const FractionalOffset(0.0, 0.8),
  );

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller.addListener(() {
      Timeline.instantSync('Animating ${controller.value}');
    });
    controller.addStatusListener((AnimationStatus status) {
      Timeline.startSync('Animation status $status');
      setState(() {});
      Timeline.finishSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new SlideTransition(
        position: new Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0.0, 0.8)).animate(controller),
        child: new Align(
          alignment: FractionalOffset.topCenter,
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                child: const Text('Present Native View'),
                onPressed: animateAndCall(presentNative),
              ),
              const Padding(padding: const EdgeInsetsDirectional.only(start: 20.0)),
              new RaisedButton(
                child: const Text('Share Native'),
                onPressed: animateAndCall(shareNative),
              )
            ],
          ),
        ),
      ),
    );
  }

  Function animateAndCall(VoidCallback function) {
    if (controller.isDismissed) {
      return () {
        controller.forward();
        function();
      };
    }

    if (controller.isCompleted) {
      return () {
        controller.reverse();
        function();
      };
    }

    return null;
  }

  Future<Null> presentNative() async {
    Timeline.startSync('Button pressed');
    new Future.delayed(
      const Duration(milliseconds: 200),
      () async {
        Timeline.startSync('Presenting native');
        await platformChannel.invokeMethod('present');
        Timeline.finishSync();
      },
    );
    Timeline.finishSync();
  }

  void shareNative() {
    share('Test string');
  }
}