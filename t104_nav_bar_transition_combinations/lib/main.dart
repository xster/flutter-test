import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(CupertinoApp(
    // builder: (BuildContext context, Widget navigator) {
    //   return Directionality(
    //     textDirection: TextDirection.rtl,
    //     child: navigator,
    //   );
    // },
    home: StartPage(),
  ));
}

int currentRouteIndex = 0;
int maxStack = 10;
Random random = Random();

List<Function> possiblePages = [
  simpleSmallTitle,
  simpleSmallCustomTitle,
  simpleSmallTitleWithLeadingOverride,
  simpleSegmentedControlWithHiddenTitle,
  simpleLargeTitle,
  largeTitleWithLeadingOverride,
  largeTitleWithSegmentedControl,
  simpleLargeTitleWithTrailing,
];

List<Function> routes = List.generate(
  maxStack,
  (int index) {
    return possiblePages[new Random().nextInt(possiblePages.length)];
  },
);

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // timeDilation = 5.0;
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
    },
  );
}

CupertinoPageRoute<void> simpleSmallCustomTitle() {
  return CupertinoPageRoute(
    title: 'Different title',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Custom title'),
        ),
        child: buildStandardBody(context),
      );
    },
  );
}

CupertinoPageRoute<void> simpleSmallTitleWithLeadingOverride() {
  return CupertinoPageRoute(
    title: 'Leading action',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            child: Icon(CupertinoIcons.share),
            onPressed: () {},
          ),
        ),
        child: buildStandardBody(context),
      );
    },
  );
}

CupertinoPageRoute<void> simpleSegmentedControlWithHiddenTitle() {
  return CupertinoPageRoute(
    title: 'Segmented controls',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        navigationBar: CupertinoNavigationBar(
          middle: CupertinoSegmentedControl<int>(
            children: {
              0: Text('iPod'),
              1: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('iPhone')),
            },
            onValueChanged: (int selected) {},
          ),
        ),
        child: buildStandardBody(context),
      );
    },
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
            SliverToBoxAdapter(
              child: SizedBox(height: 1000.0),
            ),
          ],
        ),
      );
    },
  );
}

CupertinoPageRoute<void> largeTitleWithLeadingOverride() {
  return CupertinoPageRoute(
    title: 'Large title',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                minSize: 0,
                child: Text('Edit'),
              ),
            ),
            SliverToBoxAdapter(
              child: buildStandardBody(context),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 1000.0),
            ),
          ],
        ),
      );
    },
  );
}

CupertinoPageRoute<void> largeTitleWithSegmentedControl() {
  return CupertinoPageRoute(
    title: 'Large title',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              middle: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 200.0,
                ),
                child: CupertinoSegmentedControl<int>(
                  children: {
                    0: Text('iPod'),
                    1: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('iPhone')),
                  },
                  onValueChanged: (int selected) {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: buildStandardBody(context),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 1000.0),
            ),
          ],
        ),
      );
    },
  );
}

CupertinoPageRoute<void> simpleLargeTitleWithTrailing() {
  return CupertinoPageRoute(
    title: 'Large title',
    builder: (BuildContext context) {
      return CupertinoPageScaffold(
        backgroundColor: randomColor(),
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text('Edit'),
                onPressed: () {}
              ),
            ),
            SliverToBoxAdapter(
              child: buildStandardBody(context),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 1000.0),
            ),
          ],
        ),
      );
    },
  );
}

Color randomColor() {
  return new Color.fromARGB(
    0xFF,
    random.nextInt(55) + 200,
    random.nextInt(55) + 200,
    random.nextInt(55) + 200,
  );
}

Widget buildStandardBody(BuildContext context) {
  return Center(
    child: SizedBox(
      height: 400.0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: (<Widget>[
            currentRouteIndex > 0
                ? CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: Text('Previous'),
                    onPressed: () {
                      currentRouteIndex--;
                      Navigator.pop(context);
                    },
                  )
                : null,
            currentRouteIndex < maxStack - 1
                ? CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: Text('Next'),
                    onPressed: () {
                      currentRouteIndex++;
                      Navigator.push(context, routes[currentRouteIndex]());
                    },
                  )
                : null,
          ]..removeWhere((Widget widget) => widget == null))
              .map<Widget>((Widget widget) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: widget,
                  ))
              .toList(),
        ),
      ),
    ),
  );
}
