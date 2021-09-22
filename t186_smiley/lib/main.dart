import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
            '☹️', style: TextStyle(fontFamily: 'NotoColorEmoji'),
          ),
        ),
      ),
    );
  }
}
