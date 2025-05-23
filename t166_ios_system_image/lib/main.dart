import 'package:flutter/material.dart';
import 'package:t166_ios_system_image/ios_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: IosPlatformImages.load('safari')),
                Image(image: IosPlatformImages.load('square.and.arrow.up')),
                Image(image: IosPlatformImages.load('square.and.pencil')),
                Image(image: IosPlatformImages.load('trash')),
                Image(image: IosPlatformImages.load('folder')),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: IosPlatformImages.load('note')),
                Image(image: IosPlatformImages.load('arrowshape.turn.up.left')),
                Image(image: IosPlatformImages.load('book')),
                Image(image: IosPlatformImages.load('bookmark')),
                Image(image: IosPlatformImages.load('person.fill')),
            ]),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: IosPlatformImages.load('person.crop.circle')),
                Image(image: IosPlatformImages.load('shuffle')),
                Image(image: IosPlatformImages.load('flag')),
                Image(image: IosPlatformImages.load('tag')),
                Image(image: IosPlatformImages.load('icloud')),
            ]),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: IosPlatformImages.load('phone')),
                Image(image: IosPlatformImages.load('video')),
                Image(image: IosPlatformImages.load('cart')),
                Image(image: IosPlatformImages.load('house')),
                Image(image: IosPlatformImages.load('rotate.left')),
            ])
          ],
        ),
      ),
    );
  }
}
