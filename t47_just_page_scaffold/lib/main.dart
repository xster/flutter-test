import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new IosDemoApp());
}

const Color _blue = const Color(0xFF007AFF);
const Color _gray = const Color(0xFF929292);

class IosDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          middle: const Text('Some title'),
        ),
        child: new Column(
          children: <Widget>[
            new CupertinoButton(
              child: const Text('blah'),
              onPressed: () {},
            ),
            new CupertinoSwitch(
              value: true,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}