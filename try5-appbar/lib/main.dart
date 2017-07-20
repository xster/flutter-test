import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  debugPaintLayerBordersEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and press "r" in the console where you ran "flutter run".
        // We call this a "hot reload". Notice that the counter didn't
        // reset back to zero -- the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Page1Widget(),
    );
  }
}

class Page1Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Page 1'),
        actions: <Widget> [
          new Icon(
            Icons.comment,
            size: 30.0,
          ),
          new IconButton(
            icon: new Icon(Icons.share),
            onPressed: () {},
            tooltip: 'Share',
            iconSize: 20.0,
          ),
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {},
            tooltip: 'Add',
            iconSize: 60.0,
          ),
        ],
      ),
      body: new Column(
        children: <Widget> [
          new Padding(
            padding: new EdgeInsets.all(16.0),
            child: new RaisedButton(
              child: new Center(child: new Text('Navigate')),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new Page2Widget();
                  },
                ));
              },
            ),
          ),
          new Center(
            child: new IconButton(
              icon: new Icon(Icons.link),
              onPressed: () {},
              iconSize: 100.0,
            ),
          ),
          new PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return new List<PopupMenuItem>();
            }
          ),
          new IconButton(
            icon: new Icon(Icons.link),
            onPressed: () {},
            iconSize: 100.0,
            padding: new EdgeInsets.all(40.0),
          ),
          new IconButton(
            icon: new Icon(Icons.link),
            onPressed: () {},
            iconSize: 1.0,
            padding: new EdgeInsets.all(1.0),
          ),
        ],
      ),
      drawer: new Drawer(child: new AboutDrawerItem()),
    );
  }
}

class Page2Widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Page 2'),
      ),
      body: new Center(child: new Text('second page')),
    );
  }

}
