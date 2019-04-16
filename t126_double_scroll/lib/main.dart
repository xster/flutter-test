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
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: MediaQueryData(padding: EdgeInsets.zero),
        child: Material(
          color: Colors.red,
          child: ScrollComparison(),
        )
      ),
    );
  }
}

List<Color> availableColors = [
  Colors.red[300],
  Colors.blue[300],
  Colors.green[300],
  Colors.cyan[300],
  Colors.deepOrange[300],
  Colors.indigo[300],
  Colors.pink[300],
  Colors.teal[300],
  Colors.yellow[300],
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
    colorOrder = List<Color>.generate(20, (int index) {
      return availableColors[random.nextInt(availableColors.length)];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final content = List<Widget>.generate(20, (int index) {
      return Container(
        height: 100,
        color: colorOrder[index],
        child: Center(child: Text(
          (index + 1).toString(),
          style: TextStyle(
            fontSize: 24,
          ),
        )),
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
                  physics: ClampingScrollPhysics(parent: null),
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
        Positioned(left: -40, top: 0, bottom: 0, child: Center(
          child: Transform.rotate(
            angle: pi / 2,
            child: Text('Android', style: TextStyle(fontSize: 36))),
        )),
        Positioned(right: 0, top: 0, bottom: 0, child: Center(
          child: Transform.rotate(
            angle: - pi / 2,
            child: Text('iOS', style: TextStyle(fontSize: 36))),
        )),
        Positioned.fill(
          child: MultiEventForwardingWidget(
            keys: <GlobalKey>[androidKey, iosKey],
          ),
        ),
      ],
    );
  }
}

// This is a hack. Don't do this. You also need to add
// ```dart
// @override
// void rejectGesture(int pointer) {
//   acceptGesture(pointer);
// }
// ```
// To VerticalDragGestureRecognizer for this to work, which obviously, again,
// is a hack.
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
