import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SliverChildListDelegate sliverDelegate = new SliverChildListDelegate(
      <Widget>[
        new Container(
          height: 500.0,
          width: 500.0,
          color: Colors.red,
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 90.0
          ),
          child: new Container(height: 100.0, width: 100.0, color: Colors.black),
        ),
        new Container(
          height: 500.0,
          width: 500.0,
          color: Colors.green,
        ),
        new Container(
          height: 500.0,
          width: 500.0,
          color: Colors.blue,
        ),
        new Container(
          height: 500.0,
          width: 500.0,
          color: Colors.yellow,
        ),
        new Container(
          height: 500.0,
          width: 500.0,
          color: Colors.grey,
        ),
      ]
    );

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Sliver flashing test'),
      ),
      body: new SizedBox(
        height: 200.0,
        child: new CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: <Widget>[
            new SliverPadding(
              // padding: const EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.zero,
              sliver: new SliverList(
                delegate: sliverDelegate,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: const Text('Sliver flashing test'),
//       ),
//       body: new MediaQuery(
//         data: new MediaQueryData(
//           padding: new EdgeInsets.symmetric(vertical: 100.0),
//         ),
//         child: new ListView(
//           children: <Widget>[
//             new Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 20.0,
//                 horizontal: 90.0
//               ),
//               child: new Image.asset('assets/test.png'),
//             ),
//             new Container(
//               height: 500.0,
//               color: Colors.red,
//             ),
//             new Container(
//               height: 500.0,
//               color: Colors.green,
//             ),
//             new Container(
//               height: 500.0,
//               color: Colors.blue,
//             ),
//             new Container(
//               height: 500.0,
//               color: Colors.yellow,
//             ),
//             new Container(
//               height: 500.0,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
