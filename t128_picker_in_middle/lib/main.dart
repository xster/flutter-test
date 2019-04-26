import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: CupertinoPageScaffold(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 318,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: CupertinoColors.inactiveGray),
                    bottom: BorderSide(color: CupertinoColors.inactiveGray),
                  ),
                ),
                height: 217,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (_) {},
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  height: 242,
                  child: CupertinoPicker(
                    children: <Widget>[
                      Center(child: Text('Not Set')),
                      Center(child: Text('A+')),
                      Center(child: Text('A-')),
                      Center(child: Text('B+')),
                      Center(child: Text('B-')),
                    ],
                    onSelectedItemChanged: (_) {},
                    itemExtent: 38,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              height: 400,
              left: 0,
              right: 0,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (DateTime dateTime) => {},
                initialDateTime: DateTime(2018, 1, 1, 10, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
