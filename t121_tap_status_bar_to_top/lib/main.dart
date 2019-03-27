import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // builder: (BuildContext context, Widget child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.only(top: 20)),
      //     child: child,
      //   );
      // },
      home: CupertinoPageScaffold(
        // Default nav bar is translucent.
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Title'),
        ),
        child: ListView.builder(
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index) => Text(index.toString()),
        ),
      ),
    );
  }
}
