import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Crasher',
    home: Scaffold(
      body: SafeArea(
        child: Crasher(),
      ),
    ),
  ));
}

class Crasher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child = ListWheelScrollView(
      itemExtent: 20,
      onSelectedItemChanged: (int index) {},
      children: <Widget>[
        Text('item'),
      ],
    );

    return Material(
      child: FittedBox(
        child: Center(
          child: child,
        ),
      ),
    );
  }
}