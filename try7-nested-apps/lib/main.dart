import 'package:flutter/material.dart';

void main() {
  runApp(new Outer());
}

class Outer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Outer App'),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(24.0),
          child: new Inner(),
        ),
      ),
    );
  }
}

class Inner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Inner App'),
        ),
        body: new Builder(builder: (BuildContext context) {
          return new Center(child: new RaisedButton(
            child: new Text('Next screen'),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) => new Inner2(),
              ));
            },
          ));
        }),
      ),
    );
  }
}

class Inner2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('Inner App')),
      body: new Center(child: new Text('Screen 2')),
    );
  }
}