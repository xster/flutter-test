import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Input Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Input Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = 
      new TextEditingController(text: 'Initial text');

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Text(
          _textController.text, 
          softWrap: true,
        ),
        new Material(
          child: new Container(
            height: 64.0,
            color: new Color(0xFFADD8E6),
            child: new TextField(
              controller: _textController,
              onChanged: (String text) { setState(() {}); },
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}