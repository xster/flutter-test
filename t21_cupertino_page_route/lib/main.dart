import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new WidgetsApp(
      color: const Color(0xFFFFFFFF),
      onGenerateRoute: (RouteSettings settings) {
        return new CupertinoPageRoute<Null>(
          settings: settings,
          builder: (BuildContext context) {
            return new CupertinoScaffold(
              navigationBar: new CupertinoNavigationBar(
                middle: const Text('App'),
              ),
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Page 1'),
                  new CupertinoButton(
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.push(context, new CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Page 2'),
                              new CupertinoButton(
                                child: const Text('Pop'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        }
                      ));
                    },
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}
