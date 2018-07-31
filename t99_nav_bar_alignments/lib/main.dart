import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      home: new Page(),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(
          top: 10.0,
          bottom: 5.0,
          start: 20.0,
        ),
        leading: Align(
          widthFactor: 1.0,
          alignment: Alignment.center,
          child: Text('test'),
        ),
        middle: Text('X'),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('Next'),
          onPressed: () => Navigator.push(context, CupertinoPageRoute(
            builder: (BuildContext context) => Page(),
          )),
        ),
      ),
    );
  }
}
