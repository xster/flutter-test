import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

main() => runApp(NewsApp());

class NewsApp extends StatelessWidget {
  build(context) {
    return MaterialApp(
      theme:  ThemeData(
        toggleableActiveColor: Colors.blueAccent,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: Center(
          child: SearchWidget(),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {

  final textController = TextEditingController();

  Widget build(BuildContext context) {
    print('does anything work?');
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.inactiveGray,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: CupertinoTextField(
          controller: textController,
          placeholder: "Search",
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: "SanFrancisco",
          ),
          prefix: const Padding(padding: EdgeInsets.only(left: 8.0) , child: Icon(CupertinoIcons.search)),
          decoration: const BoxDecoration(border: null),
          clearButtonMode: OverlayVisibilityMode.editing,
          // onSubmitted: (value) async {

          // }
        ),
      )
    );
  }
}
