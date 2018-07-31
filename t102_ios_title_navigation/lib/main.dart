import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPage(
        depth: 1,
      ),
    );
  }
}

class CupertinoPage extends StatelessWidget {
  CupertinoPage({ this.depth });

  final int depth;

  @override
  Widget build(BuildContext context) {
    Widget inner = Directionality(
      textDirection: TextDirection.ltr,
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: Center(
          child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: const Text('Next Page'),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (BuildContext context) {
                  return CupertinoPage(depth: depth + 1);
                },
                title: 'Page ${depth + 1} lonnnnngggggggg',
              ));
              Navigator.push(context, CupertinoPageRoute(
                builder: (BuildContext context) {
                  return CupertinoPage(depth: depth + 2);
                },
                title: 'Page ${depth + 2}',
              ));
              Navigator.push(context, CupertinoPageRoute(
                builder: (BuildContext context) {
                  return CupertinoPage(depth: depth + 3);
                },
                title: 'Page ${depth + 3}',
              ));
            },
          ),
        ),
      ),
    );

    if (depth % 2 == 0) {
      return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return inner;
      });
    } else {
      return inner;
    }
  }
}