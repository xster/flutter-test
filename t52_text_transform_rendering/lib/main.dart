import 'dart:math' show Random;

import 'package:flutter/material.dart';

void main() => runApp(new TextTest());

class TextTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TextTestState();
}

class TextTestState extends State<TextTest> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Random random;

  @override
  void initState() {
    super.initState();
    random = new Random();
    controller = new AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    )
        ..forward()
        ..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed)
            controller.reverse();
          if (status ==  AnimationStatus.dismissed)
            setState(() { controller.forward(); });
        });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: const Text('Text transform test')),
        body: new Stack(
          children: new List<Widget>.generate(40, (int index) {
            return new Align(
              alignment: new FractionalOffset(random.nextDouble(), random.nextDouble()),
              child: new RotationTransition(
                turns: new Tween<double>(
                  begin: random.nextDouble(),
                  end: random.nextDouble() * 20 - 10
                ).animate(controller),
                child: new Text(
                  new String.fromCharCode(random.nextInt(25) + 65),
                  style: const TextStyle(fontSize: 50.0),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
