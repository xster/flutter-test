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

  @override
  void initState() {
    super.initState();
    simulatedAnimation = new AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Widget bottomNavBar = buildSmallWithSegmentedMiddle(context);
    final Widget topNavBar = buildLargeWithSegmentedMiddle(context);

    return CupertinoPageScaffold(
      child: Container(
        color: Color(0xFF20FFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            bottomNavBar,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CupertinoNavigationBarTransition(
                  animation: simulatedAnimation,
                  bottomNavBar: bottomNavBar,
                  topNavBar: topNavBar,
                  bottomRoute: ModalRoute.of(context),
                  topRoute: ModalRoute.of(context),
                ),
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
            wrapSliver(topNavBar),
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

Widget buildSmallWithSegmentedMiddle(BuildContext context) {
  return CupertinoNavigationBar(
    middle: BarSegmentedControl(),
  );
}

Widget buildLargeWithSegmentedMiddle(BuildContext context) {
  return CupertinoSliverNavigationBar(
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
