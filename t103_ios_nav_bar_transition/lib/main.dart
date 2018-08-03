import 'package:flutter/cupertino.dart';

void main() => runApp(CupertinoApp(home: TestApp()));

class TestApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('Nav Bar Transition'),
      ),
      child: Center(child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: const Text('Start test'),
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(
            title: 'Test Page',
            builder: (BuildContext context) => TestPage(),
          ));
        },
      )),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CupertinoNavigationBar(),
            CupertinoNavigationBar(),
          ],
        ),
      ),
    );
  }
}
