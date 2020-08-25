import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(
    home: Builder(builder: (context) {
      return DecoratedBox(
        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Column(
          children: [
            Text(
              'System 17 Thin',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            Text(
              'System 17 Light',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              'System 17 Regular',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              'System 17 Medium',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'System 17 Bold',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              'System 30 Light',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
            ),
            Text(
              'System 30 Regular',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
            ),
            Text(
              'System 30 Semi-Bold',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            Text(
              'System 30 Bold',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
            Text('Large Title',
                style:
                    CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle),
            Text(
              'Arial 30',
              style: TextStyle(fontFamily: 'Arial', fontSize: 30),
            ),
            Text(
              '一二三四五，上山打老虎',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
            ),
          ],
        ),
      );
    }),
  ));
}
