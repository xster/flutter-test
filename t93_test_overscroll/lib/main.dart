import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Overscroll'),
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          // print(notification);
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60.0,
              color: Colors.red,
              margin: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  index.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
