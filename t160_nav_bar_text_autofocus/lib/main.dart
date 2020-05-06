import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class BuildTab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Tab1'),
            trailing: CupertinoButton(
                child: Icon(CupertinoIcons.forward),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                    return SecondPage();
                  }));
                }),
          ),
        ]));
  }
}

class BuildTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Tab2'),
            trailing: CupertinoButton(
                child: Icon(CupertinoIcons.forward),
                onPressed: () {
                  Navigator.of(context, rootNavigator:true).push(CupertinoPageRoute(builder: (context) {
                    return SecondPage();
                  }));
                }),
          ),
        ]));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.gear,
              ),
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return BuildTab1();
                break;
              case 1:
                return BuildTab2();
                break;
            }
          },
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Second Page'),
      ),
      child: ListView(
        children: <Widget>[
          CupertinoTextField(
            placeholder: 'Placeholder',
            autofocus: true,
            padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
            style: TextStyle(
              fontSize: 18,
              color: CupertinoColors.black,
            ),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
          ),
        ],
      ),
    );
  }
}