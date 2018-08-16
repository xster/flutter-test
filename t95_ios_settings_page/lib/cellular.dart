import 'package:flutter/cupertino.dart';

import 'colors.dart';
import 'group.dart';
import 'item.dart';

class CellularPage extends StatelessWidget {
  static CupertinoPageRoute<void> route = new CupertinoPageRoute(
    title: 'Cellular',
    builder: (BuildContext context) => CellularPage(),
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Settings',
      ),
      child: Container(
        color: backgroundGray,
        child: ListView(
          children: <Widget>[
            SettingsGroup(<Widget>[
              SettingsItem(
                label: 'Airplane Mode',
                iconAssetLabel: 'airplane',
                type: SettingsItemType.toggle,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
