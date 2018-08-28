import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(label, style: TextStyle(fontSize: 24.0))));
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key key, this.color, this.width, this.height, this.child});

  final Color color;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Card(
            color: color,
            elevation: 8.0,
            margin: EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
            child: child));
  }
}
