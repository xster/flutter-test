import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

const channel = MethodChannel('slider');

double sliderValue = 0;

void main() {
  print('running flutter main');
  channel.setMethodCallHandler((MethodCall call) {
    if (call.method != 'send') {
      throw UnimplementedError();
    }

    sliderValue = call.arguments[0];

    if (sliderValue == null ){
      throw ArgumentError();
    }
  });
  runApp(CupertinoApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Top native screen',
          onPressed: () {
            channel.invokeMethod('return', sliderValue);
            SystemNavigator.pop();
          }
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
            ],
          ),
        ),
      ),
    );
  }
}
