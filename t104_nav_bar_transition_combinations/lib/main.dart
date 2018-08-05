import 'package:flutter/cupertino.dart';

void main() => runApp(new CupertinoApp(
  home: new StartPage(),
));

class StartPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 200.0,
          ),
          child: SegmentedControl<int>(
            children: {
              0: Text('iPod'),
              1: Text('iPhone'),
            },
            onValueChanged: (int selected) {},
          ),
        ),
      ),
      child: Placeholder(),
    );
  }
}
