import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      title: 'Flutter Demo',
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _devices = [];
  @override
  Widget build(BuildContext context) {
    print('build! ${_devices.length}');
    return new CupertinoPageScaffold(

      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 300.0,
            child: CupertinoPicker.builder(
                itemExtent: 40.0,
                onSelectedItemChanged: (index) {
                  print(index);
                },
                itemBuilder: (context, index) {
                  print('itemBuilder');
                  return Center(
                    child: Text(
                      'item :'+_devices[index],
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                childCount: _devices.length),
          ),
          CupertinoButton(child: Text('add'),onPressed: () {
            setState(() {
              _devices.add("test");
            });
          },)
        ],
      ),
    );
  }
}
