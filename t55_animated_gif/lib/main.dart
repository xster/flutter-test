import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        appBar: new AppBar(title: const Text('Gif test')),
        body: new Center(
          child: new Image.network('https://media.giphy.com/media/11DnkOkwixZRu0/giphy.gif'),
        ),
      ),
    );
  }
}
