import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new WidgetsApp(
        color: const Color(0xFF000000),
        onGenerateRoute: (RouteSettings settings) {
          // TODO(xster): change to a CupertinoPageRoute.
          return new PageRouteBuilder<Null>(
            settings: settings,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return new DecoratedBox(decoration: const BoxDecoration(color: CupertinoColors.white),
              child: new CupertinoScaffold.tabbed(
                navigationBar: const CupertinoNavigationBar(
                  backgroundColor: CupertinoColors.white,
                  middle: const Text('Title'),
                ),
                tabBar: _buildTabBar(),
                rootPageBuilder: (BuildContext context, int index) {
                  // return new FlutterLogo(size: 100.0);
                  return new Text('Page ${index + 1}', style: const TextStyle(color: CupertinoColors.black),);
                }
              ),
            );});
        }
        ));
}

CupertinoTabBar _buildTabBar() {
  return new CupertinoTabBar(
    items: <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: const Icon(Icons.ac_unit),
        title: const Text('Tab 1'),
      ),
      const BottomNavigationBarItem(
        icon: const Icon(Icons.accessibility),
        title: const Text('Tab 2'),
      ),
    ],
    backgroundColor: CupertinoColors.white,
  );
}
