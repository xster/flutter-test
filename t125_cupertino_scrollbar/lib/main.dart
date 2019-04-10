import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CupertinoScrollbar(
        child: ListView(
          children: List.generate(20, (int i) {
            return Container(
              height: 300.0,
              color: CupertinoColors.white,
            );
          }),
        ),
      ),
    );
  }
}
