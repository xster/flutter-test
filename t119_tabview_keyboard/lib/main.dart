import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      // home: CupertinoTabView(builder: (context) {
      //   return CupertinoTextField();
      // }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar:
          CupertinoTabBar(backgroundColor: CupertinoColors.white, iconSize: 25, items: [
        BottomNavigationBarItem(
          title: Text("title"),
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(CupertinoIcons.add),
          ),
        ),
        BottomNavigationBarItem(
          title: Text("title"),
          icon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(CupertinoIcons.book),
          ),
        ),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (context) {
          switch (index) {
            case 0:
              return Page1();
              break;
            case 1:
              return Page2();
              break;
          }
        });
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CupertinoTextField(
          placeholder: 'Label',
          // decoration: InputDecoration(labelText: "Label"),
        ),
      )),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      color: CupertinoColors.darkBackgroundGray,
    ));
  }
}
