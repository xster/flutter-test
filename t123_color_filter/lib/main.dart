import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.network('https://www.apple.com/v/iphone/home/z/images/overview/designed_for_everyone_large.jpg'),
          ClipRect(
            child: ColorMatrixFilter(
              filter: ColorFilter.matrix(matrixWithSat(100)),
              child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Text('a'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorMatrixFilter extends SingleChildRenderObjectWidget {
  const ColorMatrixFilter({
    Key key,
    @required this.filter,
    Widget child,
  }) : assert(filter != null),
       super(key: key, child: child);

  final ColorFilter filter;

  @override
  RenderColorMatrixFilter createRenderObject(BuildContext context) {
    return RenderColorMatrixFilter(filter: filter);
  }

  @override
  void updateRenderObject(BuildContext context, RenderColorMatrixFilter renderObject) {
    renderObject.filter = filter;
  }
}

class RenderColorMatrixFilter extends RenderProxyBox {
  RenderColorMatrixFilter({ RenderBox child, @required ColorFilter filter })
    : assert(filter != null),
      _filter = filter,
      super(child);

  ColorFilter get filter => _filter;
  ColorFilter _filter;
  set filter(ColorFilter value) {
    assert(value != null);
    if (_filter == value)
      return;
    _filter = value;
    markNeedsPaint();
  }

  @override
  bool get alwaysNeedsCompositing => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);
      context.canvas.saveLayer(paintBounds.shift(offset), new Paint()..colorFilter = _filter);
      context.paintChild(child, offset);
      context.canvas.restore();
    }
  }
}

List<double> matrixWithSat(double sat) {
  const double kHueR = 0.213;
  const double kHueG = 0.715;
  const double kHueB = 0.072;

  double r = kHueR * (1 - sat);
  double g = kHueG * (1 - sat);
  double b = kHueB * (1 - sat);

  return <double>[
    r + sat, g, b, 0, 0, //
    r, g + sat, b, 0, 0, //
    r, g, b + sat, 0, 0, //
    0, 0, 0, 1, 0, //
  ];
}

