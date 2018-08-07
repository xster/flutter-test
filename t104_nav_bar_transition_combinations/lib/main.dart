import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(CupertinoApp(
    home: StartPage(),
  ));
}

int currentRouteIndex = 0;
int maxStack = 10;
Random random = Random();

List<Function> possiblePages = [
  simpleSmallTitle,
  simpleSegmentedControlWithHiddenTitle,
  simpleLargeTitle,
];

List<Function> routes = List.generate(
  maxStack,
  (int index) {
    return possiblePages[new Random().nextInt(possiblePages.length)];
  }
);


class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return CupertinoPageScaffold(
      backgroundColor: randomColor(),
      child: buildStandardBody(context),
    );
  }
}

CupertinoPageRoute<void> simpleSmallTitle() {
  return CupertinoPageRoute(
    title: 'Simple title',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        navigationBar: const CupertinoNavigationBar(),
        child: buildStandardBody(context),
      );
    }
  );
}

CupertinoPageRoute<void> simpleSegmentedControlWithHiddenTitle() {
  return CupertinoPageRoute(
    title: 'Segmented controls',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        navigationBar: CupertinoNavigationBar(
          middle: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 200.0,
            ),
            child: SegmentedControl<int>(
              children: {
                0: Center(child: Text('iPod')),
                1: Center(child: Text('iPhone')),
              },
              onValueChanged: (int selected) {},
            ),
          ),
        ),
        child: buildStandardBody(context),
      );
    }
  );
}

CupertinoPageRoute<void> simpleLargeTitle() {
  return CupertinoPageRoute(
    title: 'Large title',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        child: CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(),
            SliverToBoxAdapter(
              child: buildStandardBody(context),
            ),
          ],
        ),
      );
    }
  );
}

Color randomColor() {
  return new Color.fromARGB(
    0xFF,
    random.nextInt(55) + 100,
    random.nextInt(55) + 100,
    random.nextInt(55) + 100,
  );
}

Widget buildStandardBody(BuildContext context) {
  return Center(
    child: SizedBox(
      height: 400.0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: (
            <Widget>[
              currentRouteIndex > 0 ?
                  CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: Text('Previous'),
                    onPressed: () {
                      currentRouteIndex--;
                      Navigator.pop(context);
                    },
                  ) :
                  null,
              currentRouteIndex < maxStack - 1 ?
                  CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: Text('Next'),
                    onPressed: () {
                      currentRouteIndex++;
                      Navigator.push(context, routes[currentRouteIndex]());
                    },
                  ) :
                  null,
            ]
                ..removeWhere((Widget widget) => widget == null)
          )
              .map<Widget>((Widget widget) => Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: widget,
              )).toList(),
        ),
      ),
    ),
  );
}

