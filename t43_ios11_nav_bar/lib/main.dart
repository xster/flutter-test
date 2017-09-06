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
      debugShowCheckedModeBanner: false,
      title: 'iOS Demo',
      home: new DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          decorationStyle: null,
          fontFamily: '.SF UI Text',
        ),
        child: new DecoratedBox(
          decoration: const BoxDecoration(color: CupertinoColors.white),
          child: new CupertinoScaffold(
            child: new CustomScrollView(
              slivers: <Widget>[
                new CupertinoNavigationBar(
                  leading: new CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    child: const Text('Cancel'),
                    pressedOpacity: 1.0,
                    onPressed: () {},
                  ),
                  middle: const Text(
                    'Add neural reading function',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: const ImageIcon(const AssetImage('assets/search.png')),
                  largeTitle: true,
                ),
                new SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return new Container(
                        alignment: FractionalOffset.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: new Text('list item $index'),
                      );
                    },
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
