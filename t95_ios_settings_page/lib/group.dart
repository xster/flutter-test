import 'package:flutter/cupertino.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup(this.items);

  static const Color borderColor = const Color(0xFFBCBBC1);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    List<Widget> dividedItems = items;
    if (items.length > 1) {
      dividedItems = dividedItems.map<Widget>((Widget item) {
        if (dividedItems.last == item) {
          return item;
        } else {
          return Stack(
            children: <Widget>[
              Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 58.0,
                child: new Container(
                  color: borderColor,
                  height: 0.3,
                ),
              ),
              item,
            ],
          );
        }
      }).toList();
    }

    return Container(
      margin: EdgeInsets.only(top: 35.0),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border(
            top: const BorderSide(
              color: borderColor,
              width: 0.0,
            ),
            bottom: const BorderSide(
              color: borderColor,
              width: 0.0,
            )),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: dividedItems),
    );
  }
}