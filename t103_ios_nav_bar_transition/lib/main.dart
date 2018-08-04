import 'package:flutter/cupertino.dart';

void main() => runApp(CupertinoApp(home: TestApp()));

class TestApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('Nav Bar Transition'),
      ),
      child: Center(
          child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: const Text('Start test'),
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  title: 'Test Page',
                  builder: (BuildContext context) => TestPage()));
        },
      )),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  AnimationController simulatedAnimation;
  GlobalKey topKey;
  GlobalKey bottomKey;
  Widget bottomNavBar;
  Widget topNavBar;

  @override
  void initState() {
    super.initState();
    simulatedAnimation = new AnimationController(vsync: this);
    bottomKey = new GlobalKey();
    topKey = new GlobalKey();
    bottomNavBar = buildSmallWithLeadingButton(bottomKey);
    topNavBar = buildLargeWithSegmentedMiddle(topKey);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        // color: Color(0xFF20FFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            wrapSliver(topNavBar),
            SizedBox(
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  topKey.currentContext != null && bottomKey.currentContext != null
                      ?  CupertinoNavigationBarTransition(
                        animation: simulatedAnimation,
                        bottomNavBar: bottomNavBar,
                        topNavBar: topNavBar,
                        bottomContext: bottomKey.currentContext,
                        topContext: topKey.currentContext,
                      ) : Placeholder(fallbackHeight: 100.0),
                  CupertinoSlider(
                    min: 0.0,
                    max: 1.0,
                    value: simulatedAnimation.value,
                    onChanged: (double value) {
                      setState(() { simulatedAnimation.value = value; });
                    },
                  ),
                ],
              ),
            ),
            bottomNavBar,
          ],
        ),
      ),
    );
  }
}

class BarSegmentedControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BarSegmentedControlState();
}

class BarSegmentedControlState extends State<BarSegmentedControl> {
  int selected;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200.0),
      child: SegmentedControl(
        children: {
          0: Center(child: Text('Option A')),
          1: Center(child: Text('Option B')),
        },
        onValueChanged: (int newSelected) {
          setState(() {
            selected = newSelected;
          });
        },
        groupValue: selected,
      ),
    );
  }
}

Widget buildSmallWithSegmentedMiddle(Key key) {
  return CupertinoNavigationBar(
    key: key,
    middle: BarSegmentedControl(),
  );
}

Widget buildSmallWithTitleOverride(Key key) {
  return CupertinoNavigationBar(
    key: key,
    middle: Text('Small Title'),
  );
}

Widget buildSmallWithLeadingButton(Key key) {
  return CupertinoNavigationBar(
    key: key,
    leading: CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(CupertinoIcons.refresh),
      onPressed: () {},
    ),
  );
}

Widget buildLargeWithSegmentedMiddle(Key key) {
  return CupertinoSliverNavigationBar(
    key: key,
    middle: BarSegmentedControl(),
    largeTitle: Text('Override'),
  );
}

Widget wrapSliver(Widget child) {
  return CustomScrollView(
    shrinkWrap: true,
    slivers: <Widget>[
      child,
    ],
  );
}
