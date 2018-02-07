import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Material(
        color: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: const InputDecoration(hintText: 'Text outside tabs'),
            ),
            new SizedBox(
              height: 400.0,
              child: new CupertinoTabView( // Just a convenient way of adding a Navigator
                builder: (BuildContext context) {
                  return new Column(
                    children: <Widget>[
                      new TextField(
                        decoration: const InputDecoration(hintText: 'Text on page 1'),
                      ),
                      new RaisedButton(
                        child: const Text('Next page'),
                        onPressed: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) {
                              return new TextField(
                                decoration: const InputDecoration(hintText: 'Text on page 2'),
                              );
                            },
                          ));
                        },
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
