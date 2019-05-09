import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(CupertinoApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: 'Top native screen',
          onPressed: () => SystemNavigator.pop(),
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
              CupertinoSwitch(
                value: switchValue,
                onChanged: (value) => setState(() => switchValue = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
