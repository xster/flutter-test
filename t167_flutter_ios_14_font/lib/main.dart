import 'package:flutter/widgets.dart';

void main() => runApp(DecoratedBox(
  decoration: BoxDecoration(
    color: Color(0xFFFFFFFF),
    border: Border.all(
      color: Color(0xFFFF0000),
      width: 1,
    )
  ),
  child: Directionality(
    textDirection: TextDirection.ltr,
    child: Column(
      children: [
        Text(
          'Default system 30 font',
          style: TextStyle(
            fontFamily: '.SF Pro Display',
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            // letterSpacing: -1.5,
            color: Color(0xFF000000),
          ),
        ),
        Text(
          '| | | | | | | | | | Default system 17 font | | | | | | | | | |',
          style: TextStyle(
            fontFamily: '.SF Pro Text',
            fontSize: 17.0,
            letterSpacing: -0.41,
            color: Color(0xFF000000),
            // letterSpacing: 0.36
          ),
        ),
        Text(
          'Arial 70',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 70,
            color: Color(0xFF000000),
          )
        ),
        Text(
          '| | | | | | | | | | Open Sans 17 font | | | | | | | | | |',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 17.0,
            color: Color(0xFF000000),
          )
        ),
        Text(
          '| | | | | | | | | | System Arial 17 font | | | | | | | | | |',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 17.0,
            color: Color(0xFF000000),
          )
        ),
      ],
    ),
  ),
));
