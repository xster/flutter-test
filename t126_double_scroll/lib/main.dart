import 'dart:math';
import 'package:flutter/material.dart';

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
    return Row(
      children: <Widget>[
        Expanded(
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.blue,
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: content,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: content,
          ),
        )
      ],
    );
  }
}
