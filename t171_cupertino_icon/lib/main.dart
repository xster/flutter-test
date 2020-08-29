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
            CupertinoIcon.cube(),
            CupertinoIcon('square.and.arrow.up', size: 200),
          ]),
        ),
      ),
    );
  }
}
