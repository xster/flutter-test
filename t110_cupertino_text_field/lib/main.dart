import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Text Fields'),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CupertinoTextField(
                  placeholder: 'Placeholder',
                  clearButtonMode: OverlayVisibilityMode.editing,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                CupertinoTextField(
                  leading: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      minSize: 0.0,
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(4.0),
                      child: Icon(CupertinoIcons.add, size: 16.0, color: CupertinoColors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
