import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Android Bug',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Android Bug'),
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        // Try altering this
        margin: const EdgeInsets.only(top: 100.0),
        // Try altering this
        height: 300.0,
        child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Material(
            borderRadius: new BorderRadius.all(
              new Radius.circular(4.0),
            ),
            elevation: 15.0,
            color: Colors.red[100],
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child:
                  new Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                        "elit, sed do eiusmod tempor incididunt ut labore "
                        "et dolore magna aliqua. Ut enim ad minim veniam, "
                        "quis nostrud exercitation ullamco laboris nisi "
                        "ut aliquip ex ea commodo consequat."
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                        "elit, sed do eiusmod tempor incididunt ut labore "
                        "et dolore magna aliqua. Ut enim ad minim veniam, "
                        "quis nostrud exercitation ullamco laboris nisi "
                        "ut aliquip ex ea commodo consequat."
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                        "elit, sed do eiusmod tempor incididunt ut labore "
                        "et dolore magna aliqua. Ut enim ad minim veniam, "
                        "quis nostrud exercitation ullamco laboris nisi "
                        "ut aliquip ex ea commodo consequat."
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                        "elit, sed do eiusmod tempor incididunt ut labore "
                        "et dolore magna aliqua. Ut enim ad minim veniam, "
                        "quis nostrud exercitation ullamco laboris nisi "
                        "ut aliquip ex ea commodo consequat."
                    "Lorem ipsum dolor sit amet, consectetur adipiscing "
                        "elit, sed do eiusmod tempor incididunt ut labore "
                        "et dolore magna aliqua. Ut enim ad minim veniam, "
                        "quis nostrud exercitation ullamco laboris nisi "
                        "ut aliquip ex ea commodo consequat.",
                    // maxLines: 10,
                    // style: const TextStyle(fontSize: 40.0),
                  ),
                ),
                new MaterialButton(
                  color: Colors.blue,
                  child: new Text("Press Me"),
                  onPressed: () {},
                ),
                // new CircleAvatar(
                //   radius: 30.0,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}