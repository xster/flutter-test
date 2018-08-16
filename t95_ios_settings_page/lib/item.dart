import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'colors.dart';

enum SettingsItemType {
  // Just on and off.
  toggle,
  // Navigates to another page of detailed settings.
  modal,
}

typedef Future<void> PressOperationCallback();

class SettingsItem extends StatefulWidget {
  const SettingsItem({
    @required this.label,
    @required this.iconAssetLabel,
    @required this.type,
    this.initialModalValue,
    this.onPress,
  }) : assert(label != null),
       assert(iconAssetLabel != null),
       assert(type != null);

  final String label;
  final String iconAssetLabel;
  final SettingsItemType type;
  final String initialModalValue;
  final PressOperationCallback onPress;

  @override
  State<StatefulWidget> createState() => new SettingsItemState();
}

class SettingsItemState extends State<SettingsItem> {
  bool switchValue = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: pressed ? itemPressedColor : null,
      child: GestureDetector(
        onTap: () {
          if (widget.onPress != null) {
            setState(() { pressed = true; });
            widget.onPress().whenComplete(() {
              setState(() { pressed = false; });
            });
          }
        },
        child: SizedBox(
          height: 45.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 2.0,
                ),
                child: Image.asset(
                  'assets/${widget.iconAssetLabel}.png',
                  package: 'ios_settings_icons',
                  height: 29.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.5),
                  child: Text(widget.label),
                ),
              ),
              () {
                switch (widget.type) {
                  case SettingsItemType.toggle:
                    return Padding(
                      padding: const EdgeInsets.only(right: 11.0),
                      child: CupertinoSwitch(
                        value: switchValue,
                        onChanged: (bool value) =>
                            setState(() => switchValue = value),
                      ),
                    );
                    break;
                  case SettingsItemType.modal:
                    return Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 1.5),
                          child: Text(
                            widget.initialModalValue ?? '',
                            style: TextStyle(color: CupertinoColors.inactiveGray),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.5,
                            top: 0.5,
                            left: 4.5,
                          ),
                          child: Icon(
                            CupertinoIcons.forward,
                            color: mediumGrayColor,
                            size: 21.0,
                          ),
                        ),
                      ],
                    );
                    break;
                }
              }(),
            ],
          ),
        ),
      ),
    );
  }
}
