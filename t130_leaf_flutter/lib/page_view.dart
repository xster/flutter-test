import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';

const channel = MethodChannel('slider');

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double sliderValue = 0;

  @override
  void initState() {
    super.initState();

    channel.setMethodCallHandler((MethodCall call) {
      if (call.method != 'send') {
        throw UnimplementedError();
      }

      if (call.arguments is! double) {
        throw ArgumentError();
      }

      setState(() => sliderValue = call.arguments);
    });
  }

  void pop() {
    channel.invokeMethod('return', sliderValue);
    SystemNavigator.pop();
  }

  Widget buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Top native screen',
          onPressed: pop,
        ),
        middle: Text('Flutter screen'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton.filled(
                child: Text('Deeper'),
                onPressed: () => Navigator.push(context, CupertinoPageRoute(
                  title: 'Inner Flutter screen',
                  builder: (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(previousPageTitle: 'Flutter screen'),
                    child: Center(child: Text('Inner page')),
                  ),
                )),
              ),
              CupertinoSlider(
                value: sliderValue,
                onChanged: (value) => setState(() => sliderValue = value),
              ),
              if (!MediaQuery.of(context).size.isEmpty) Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 10)
                ),
                // child: WebView(
                //   initialUrl: 'https://apple.com',
                //   javascriptMode: JavascriptMode.unrestricted,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: pop,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Deeper'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(title: Text('Inner Flutter page')),
                  body: Center(child: Text('Inner page')),
                ),
              )),
            ),
            Slider(
              value: sliderValue,
              onChanged: (value) => setState(() => sliderValue = value),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.iOS
      ? buildIos(context)
      : buildAndroid(context);
  }
}
