import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(child: Center(
        child: Column(
          children: [
            Text(
              'Arial 70',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 70
              )
            ),
            Text(
              '| | | | | | | | | | Default system 17 font | | | | | | | | | |',
              style: TextStyle(
                fontFamily: '.SFUI-Regular',
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.41,
                // letterSpacing: 0.36
              ),
            ),
            Text(
              '| | | | | | | | | | System Arial 17 font | | | | | | | | | |',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 17.0
              )
            ),
            Text(
              '| | | | | | | | | | Open Sans 17 font | | | | | | | | | |',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 17.0
              )
            )
          ],
        ),
      )),
    );
  }
}
