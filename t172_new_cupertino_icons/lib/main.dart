import 'package:flutter/cupertino.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Cupertino Icon')),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.cube),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.square_arrow_up, size: 200),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.book, size: 100),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.chevron_back),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.chevron_left),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.bluetooth),
            ),
            DecoratedBox(
              decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
              child: Icon(CupertinoIcons.sportscourt_fill, size: 300),
            ),
          ]),
        ),
      ),
    );
  }
}