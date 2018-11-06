import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        // primaryColor: CupertinoColors.activeGreen,
        // scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  DemoState createState() {
    return new DemoState();
  }
}

class DemoState extends State<Demo> {
  double _sliderValue = 0.5;
  int _segmentedValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Test'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0.0,
          onPressed: () {},
          child: Icon(CupertinoIcons.bluetooth),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CupertinoTheme(
                data: CupertinoThemeData(),
                child: CupertinoButton.filled(
                  onPressed: () {},
                  child: Text('Button'),
                ),
              ),
              CupertinoSlider(
                value: _sliderValue,
                onChanged: (double value) => setState(() => _sliderValue = value),
              ),
              Text('Just text'),
              CupertinoTextField(placeholder: 'Just this text field'),
              CupertinoSegmentedControl<int>(
                groupValue: _segmentedValue,
                onValueChanged: (int value) => setState(() => _segmentedValue = value),
                children: <int, Widget>{
                  0: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('First'),
                  ),
                  1: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Second'),
                  ),
                  2: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Third'),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
