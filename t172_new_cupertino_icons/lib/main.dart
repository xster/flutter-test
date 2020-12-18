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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  child: Icon(CupertinoIcons.chevron_back, size: 200),
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
                  child: Icon(CupertinoIcons.sportscourt_fill, size: 80),
                ),
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.airplane, size: 100),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.dial, size: 100),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.envelope_circle_fill, size: 80),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.playpause, size: 120),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.star, size: 150),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.alarm, size: 100),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF000000))),
                  child: Icon(CupertinoIcons.speaker_fill, size: 100),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}