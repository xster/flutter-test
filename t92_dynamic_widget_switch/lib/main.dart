import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WidgetList(),
    );
  }
}

class WidgetList extends StatefulWidget {
  WidgetList({Key key}) : super(key: key);

  @override
  _WidgetListState createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  TargetPlatform selectedPlatform;

  bool testSwitch;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            platform: selectedPlatform,
            adaptiveWidgetTheme: AdaptiveWidgetThemeData.all),
        child: Scaffold(
            appBar: AppBar(
                title: Text('Dynamic Widgets'),
                leading: Builder(
                    builder: (BuildContext context) => Switch(
                        value: Theme.of(context).platform == TargetPlatform.iOS,
                        onChanged: (bool iOS) => setState(() =>
                            selectedPlatform = iOS
                                ? TargetPlatform.iOS
                                : TargetPlatform.android)))),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  Switch(
                      value: testSwitch == true,
                      onChanged: (bool value) =>
                          setState(() => testSwitch = value)),
                  Text('You have pushed the button this many times:')
                ]))));
  }
}
