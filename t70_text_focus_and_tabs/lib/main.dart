import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SafeArea(
        bottom: false,
        child: new Material(
          color: Colors.yellow,
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: const InputDecoration(hintText: 'Text outside tabs'),
              ),
              new SizedBox(
                height: 600.0,
                child: new CupertinoTabScaffold(
                  tabBar: new CupertinoTabBar(
                    items: <BottomNavigationBarItem>[
                      new BottomNavigationBarItem(
                        icon: new Icon(Icons.directions_car),
                        title: new Text('Left'),
                      ),
                      new BottomNavigationBarItem(
                        icon: new Icon(Icons.directions_railway),
                        title: new Text('Right'),
                      ),
                    ],
                  ),
                  tabBuilder: (BuildContext context, int index) {
                    return new CupertinoTabView(
                      builder: (BuildContext context) {
                        return new CupertinoPageScaffold(
                          navigationBar: new CupertinoNavigationBar(
                            middle: new Text(index == 0 ? 'Left' : 'Right'),
                          ),
                          child: new Material(
                            child: new Container(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: new Column(children: <Widget>[
                                new TextField(),
                                new TextField(),
                              ]),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}