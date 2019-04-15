import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MediaQuery(
        data: MediaQueryData(padding: EdgeInsets.zero),
        child: ScrollComparison()
      ),
    );
  }
}

List<Color> availableColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.cyan,
  Colors.deepOrange,
  Colors.indigo,
  Colors.pink,
  Colors.teal,
  Colors.yellow,
];

class ScrollComparison extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ScrollComparisonState();
}

class ScrollComparisonState extends State<ScrollComparison> {
  List<Color> colorOrder;

  final androidKey = GlobalKey();
  final iosKey = GlobalKey();

  @override
  void initState() {
    final random = Random();
    colorOrder = List<Color>.generate(100, (int index) {
      return availableColors[random.nextInt(availableColors.length)];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final content = List<Widget>.generate(100, (int index) {
      return Container(
        height: 100,
        color: colorOrder[index],
      );
    });
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.blue,
                child: ListView(
                  key: androidKey,
                  physics: ClampingScrollPhysics(),
                  children: content,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                key: iosKey,
                physics: BouncingScrollPhysics(),
                children: content,
              ),
            )
          ],
        ),
        Positioned.fill(
          child: MultiEventForwardingWidget(
            keys: <GlobalKey>[androidKey, iosKey],
          ),
        ),
      ],
    );
  }
}

// This is a hack. Don't do this.
class MultiEventForwardingWidget extends SingleChildRenderObjectWidget {
  MultiEventForwardingWidget({
    this.keys,
    Widget child
  }) : super(child: child);

  final List<GlobalKey> keys;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMultiEventForwarding(keys);
  }
}

class RenderMultiEventForwarding extends RenderProxyBoxWithHitTestBehavior {
  RenderMultiEventForwarding(this._keys) : super(behavior: HitTestBehavior.opaque);

  List<GlobalKey> _keys;
  set keys(List<GlobalKey> keys) {
    _keys = keys;
  }
  List<RenderPointerListener> targetObjects;

  void findScrollableListener(Element element) {
    if (element.renderObject is RenderPointerListener) {
      final RenderPointerListener pointerListener = element.renderObject;
      if (pointerListener.behavior == HitTestBehavior.opaque && pointerListener.onPointerDown != null) {
        targetObjects.add(element.renderObject);
      } else {
        element.visitChildren(findScrollableListener);
      }
    } else {
      element.visitChildren(findScrollableListener);
    }
  }

  void findForwardingTargets() {
    for (var key in _keys) {
      key.currentContext.visitChildElements(findScrollableListener);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    targetObjects = List<RenderPointerListener>();
    findForwardingTargets();
    super.paint(context, offset);
  }

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    for (RenderPointerListener descendent in targetObjects) {
      descendent.handleEvent(event, entry);
    }
  }
}
