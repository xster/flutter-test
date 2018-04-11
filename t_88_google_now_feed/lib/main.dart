import 'package:flutter/material.dart';

void main() {
  runApp(
    new SizedBox(
      height: 20.0,
      child: new Image.network('https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg'),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting
//         // the app, try changing the primarySwatch below to Colors.green
//         // and then invoke "hot reload" (press "r" in the console where
//         // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
//         // Notice that the counter didn't reset back to zero -- the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful,
//   // meaning that it has a State object (defined below) that contains
//   // fields that affect how it looks.

//   // This class is the configuration for the state. It holds the
//   // values (in this case the title) provided by the parent (in this
//   // case the App widget) and used by the build method of the State.
//   // Fields in a Widget subclass are always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class NewsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       width: 288.0,
//       margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
//       decoration: new BoxDecoration(
//         color: Colors.white,
//         boxShadow: <BoxShadow>[
//           new BoxShadow(
//             offset: new Offset(0.0, 1.0),
//             blurRadius: 3.0,
//             color: const Color(0x55000000),
//           ),
//         ],
//         borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
//       ),
//       padding: const EdgeInsets.all(12.0),
//       child: new Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           new Container(
//             width:192.0,
//             height: 188.0,
//             margin: const EdgeInsets.only(top:4.0),
//             child: new Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 new Text(
//                   'Multi line title for a news article',
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 3,
//                   style: new TextStyle(color: Colors.black.withOpacity(0.95)),
//                 ),
//                 new Expanded(
//                   child: new LayoutBuilder(
//                       builder: (BuildContext context, BoxConstraints constraints) {
//                         print(DefaultTextStyle.of(context).style);
//                     var lineHeight = 18.0;
//                     var maxLines = (constraints.maxHeight / lineHeight).floor();
//                     return new Container(
//                       margin: new EdgeInsets.only(top: constraints.maxHeight - lineHeight * maxLines),
//                       child: new Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: maxLines,
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//           new Container(
//             width:60.0,
//             height: 60.0,
//             margin: const EdgeInsets.only(left: 12.0),
//             child: new DecoratedBox(
//               decoration: new BoxDecoration(
//                 image: new DecorationImage(
//                   image: new NetworkImage('http://www.pvhc.net/img35/mkeziivkxbsllcdzqmxx.jpg'),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NewsCarousel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       height: 216.0,
//       decoration: new BoxDecoration(
//         color: Colors.white,
//       ),
//       child: new ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           new NewsCard(),
//           new NewsCard(),
//           new NewsCard(),
//           new NewsCard(),
//           new NewsCard(),
//         ],
//       ),
//     );
//   }
// }

// class WeatherCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
//       decoration: new BoxDecoration(
//         color: Colors.white,
//         boxShadow: <BoxShadow>[
//           new BoxShadow(
//             offset: new Offset(0.0, 1.0),
//             blurRadius: 3.0,
//             color: const Color(0x55000000),
//           ),
//         ],
//         borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
//       ),
//       padding: const EdgeInsets.all(12.0),
//       child: new Container(
//         height: 50.0,
//         child: new Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             new Container(
//               width:60.0,
//               height: 60.0,
//               margin: new EdgeInsets.only(right: 12.0),
//               child: new DecoratedBox(
//                 decoration: new BoxDecoration(
//                   image: new DecorationImage(
//                     image: new NetworkImage('https://cdn1.iconfinder.com/data/icons/weather-forecast-meteorology-color-1/128/weather-sunny-512.png'),
//                   ),
//                 ),
//               ),
//             ),
//             new Flexible(
//               fit: FlexFit.tight,
//               child: new Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   new Flexible(
//                     fit: FlexFit.tight,
//                     child: new Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         new Text( "8° in Cambridge"),
//                       ],
//                     ),
//                   ),
//                   new Flexible(
//                     fit: FlexFit.tight,
//                     child: new Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         new Text( "Sunny"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             new Flexible(
//               fit: FlexFit.tight,
//               child: new Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   new Flexible(
//                     fit: FlexFit.tight,
//                     child: new Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         new Text( "12° / 4°"),
//                       ],
//                     ),
//                   ),
//                   new Flexible(
//                     fit: FlexFit.tight,
//                     child: new Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         new Text( "10% humidity"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SportsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
//       decoration: new BoxDecoration(
//         color: Colors.white,
//         boxShadow: <BoxShadow>[
//           new BoxShadow(
//             offset: new Offset(0.0, 1.0),
//             blurRadius: 3.0,
//             color: const Color(0x55000000),
//           ),
//         ],
//         borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
//       ),
//       padding: const EdgeInsets.all(12.0),
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           new Container(
//             height: 24.0,
//             margin: new EdgeInsets.only(bottom: 12.0),
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                   width:24.0,
//                   height: 24.0,
//                   margin: new EdgeInsets.only(right: 12.0),
//                   child: new DecoratedBox(
//                     decoration: new BoxDecoration(
//                       image: new DecorationImage(
//                         image: new NetworkImage('http://www.pvhc.net/img35/mkeziivkxbsllcdzqmxx.jpg'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 new Flexible(
//                   fit: FlexFit.tight,
//                   child: new Text("New england patriots"),
//                 ),
//               ],
//             ),
//           ),
//           new Container(
//             height: 120.0,
//             margin: new EdgeInsets.only(bottom: 12.0),
//             // foregroundDecoration: new BoxDecoration(
//             //   image: new DecorationImage(
//             //     fit: BoxFit.cover,
//             child: new Image.network('https://musketfire.com/wp-content/uploads/getty-images/2017/10/865191200-atlanta-falcons-v-new-england-patriots.jpg.jpg'),
//               // ),
//             // ),
//           ),
//           new Container(
//             margin: new EdgeInsets.only(bottom: 12.0),
//             child: new Text("Could Patriots' Unheralded, Undrafted Lineman Compete For Left Tackle Job?"),
//           ),
//           new Container(
//             margin: new EdgeInsets.only(bottom: 12.0),
//             child: new Text("It's widely assumed the New England Patriots will select an offensive tackle in the first round of the 2..."),
//           ),
//           new Container(
//             height: 16.0,
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                   width:16.0,
//                   height: 16.0,
//                   margin: new EdgeInsets.only(right: 12.0),
//                   child: new DecoratedBox(
//                     decoration: new BoxDecoration(
//                       image: new DecorationImage(
//                         image: new NetworkImage('http://www.pvhc.net/img35/mkeziivkxbsllcdzqmxx.jpg'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 new Flexible(
//                   fit: FlexFit.tight,
//                   child: new Text("Blazer's Edge - 20 hr ago"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SmallSportsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
//       decoration: new BoxDecoration(
//         color: Colors.white,
//         boxShadow: <BoxShadow>[
//           new BoxShadow(
//             offset: new Offset(0.0, 1.0),
//             blurRadius: 3.0,
//             color: const Color(0x55000000),
//           ),
//         ],
//         borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
//       ),
//       padding: const EdgeInsets.all(12.0),
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           new Container(
//             height: 24.0,
//             margin: new EdgeInsets.only(bottom: 12.0),
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                   width:24.0,
//                   height: 24.0,
//                   margin: new EdgeInsets.only(right: 12.0),
//                   child: new DecoratedBox(
//                     decoration: new BoxDecoration(
//                       image: new DecorationImage(
//                         image: new NetworkImage('http://i.cdn.turner.com/nba/nba/.element/img/1.0/teamsites/logos/teamlogos_500x500/mem.png'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 new Flexible(
//                   fit: FlexFit.tight,
//                   child: new Text("Memphis Grizzlies"),
//                 ),
//               ],
//             ),
//           ),
//           new Row(
//             children: <Widget>[
//               new Expanded(
//                 child: new Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     new Container(
//                       margin: new EdgeInsets.only(bottom: 12.0),
//                       child: new Text("McCollum Scores 42, but Blazers fall to Grizzlies"),
//                     ),
//                     new Container(
//                       margin: new EdgeInsets.only(bottom: 12.0),
//                       child: new Text("With Damian Lillard home to attend to the birth of his first chield, the Portlan..."),
//                     ),
//                   ],
//                 ),
//               ),
//               new Container(
//                 width: 60.0,
//                 height: 60.0,
//                 margin: new EdgeInsets.only(bottom: 12.0),
//                 foregroundDecoration: new BoxDecoration(
//                   image: new DecorationImage(
//                     fit: BoxFit.cover,
//                     image: new NetworkImage('https://bealestreetbears.com/wp-content/uploads/usat-images/2016/04/9894738-nba-memphis-grizzlies-at-denver-nuggets-1.jpeg'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           new Container(
//             height: 16.0,
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                   width:16.0,
//                   height: 16.0,
//                   margin: new EdgeInsets.only(right: 12.0),
//                   child: new DecoratedBox(
//                     decoration: new BoxDecoration(
//                       image: new DecorationImage(
//                         image: new NetworkImage('http://www.pvhc.net/img35/mkeziivkxbsllcdzqmxx.jpg'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 new Flexible(
//                   fit: FlexFit.tight,
//                   child: new Text("Blazer's Edge - 20 hr ago"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that
//       // something has changed in this State, which causes it to rerun
//       // the build method below so that the display can reflect the
//       // updated values. If we changed _counter without calling
//       // setState(), then the build method would not be called again,
//       // and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance
//     // as done by the _incrementCounter method above.
//     // The Flutter framework has been optimized to make rerunning
//     // build methods fast, so that you can just rebuild anything that
//     // needs updating rather than having to individually change
//     // instances of widgets.
//     return new Scaffold(
//       appBar: new AppBar(
//         // Here we take the value from the MyHomePage object that
//         // was created by the App.build method, and use it to set
//         // our appbar title.
//         title: new Text(widget.title),
//       ),
//       body: new ListView(
//         scrollDirection: Axis.vertical,
//         children: <Widget>[
//           new WeatherCard(),
//           new SportsCard(),
//           new SmallSportsCard(),
//           new WeatherCard(),
//           new SportsCard(),
//           new SmallSportsCard(),
//         ],
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }