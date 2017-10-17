import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new IntegrationApp());
}



class IntegrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MaterialPage(),
    );
  }
}

class MaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Material Page'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: const Text('Cupertino Page'),
          onPressed: () {
            Navigator.push(context, new CupertinoPageRoute(
              builder: (BuildContext context) => new CupertinoPage()
            ));
          },
        )
      ),
    );
  }
}

class CupertinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('Cupertino Page'),
      ),
      child: new Center(
        child: new CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: const Text('Mixed Page 1'),
          onPressed: () { Navigator.push(context, new MaterialPageRoute(
              builder: (BuildContext context) => new MixedPage1()
            ));
          }
        ),
      ),
    );
  }
}

class MixedPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: const Text('Cupertino in Material'),
        trailing: new IconButton( // Material button
          icon: new Icon(Icons.search),
          onPressed: () {},
        ),
        backgroundColor: const Color(0xFFF8F8F8),
      ),
      // No automatic tab switching without CupertinoTabScaffold of course.
      bottomNavigationBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.info),
            title: const Text('Item 1'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.conversation_bubble),
            title: const Text('Item 2'),
          ),
        ],
      ),
      body: new Center(
        child: new CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: const Text('Mixed Page 2'),
          onPressed: () {
            Navigator.push(context, new CupertinoPageRoute(
              builder: (BuildContext context) => new MixedPage2()
            ));
          },
        )
      ),
    );
  }
}

class MixedPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new AppBar(
        title: const Text('Material in Cupertino'),
        actions: <Widget>[
          new CupertinoButton(
            child: const Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
        ],
      ),
      child: new Center(
        child: const Text(
          'The end',
          style: const TextStyle(
            fontSize: 36.0,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}