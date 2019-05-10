import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

const channel = MethodChannel('slider');

void main() {
  runApp(CupertinoApp(home: MyApp()));
}

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
      print('sent $sliderValue');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('presently $sliderValue');
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
