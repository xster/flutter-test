import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: Foo(),
  ));
}

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(),
      )
    );
  }
}