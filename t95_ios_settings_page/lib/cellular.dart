import 'package:flutter/cupertino.dart';

import 'colors.dart';
import 'group.dart';
import 'item.dart';

class CellularPage extends StatelessWidget {
  static CupertinoPageRoute<void> route() => new CupertinoPageRoute(
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
            SettingsGroup(
              <Widget>[
                SettingsItem(
                  label: 'Cellular Data',
                  type: SettingsItemType.toggle,
                ),
                SettingsItem(
                  label: 'Cellular Data Options',
                  type: SettingsItemType.modal,
                  value: 'Roaming On',
                  hasDetails: true,
                ),
                SettingsItem(
                  label: 'Personal Hotspot',
                  type: SettingsItemType.modal,
                  value: 'Off',
                  hasDetails: true,
                ),
              ],
              footer: Text(
                'Turn off cellular data to restrict all data to Wi-Fi,\n'
                'including email, web browsing, and push notifications.'
              ),
            ),
            SettingsGroup(
              <Widget>[
                SettingsItem(
                  label: 'Wi-Fi Calling',
                  type: SettingsItemType.modal,
                  value: 'Off',
                  hasDetails: true,
                ),
                SettingsItem(
                  label: 'Calls on Other Devices',
                  type: SettingsItemType.modal,
                  value: 'When Nearby',
                  hasDetails: true,
                ),
                SettingsItem(
                  label: 'Carrier Services',
                  type: SettingsItemType.modal,
                  hasDetails: true,
                ),
                SettingsItem(
                  label: 'SIM PIN',
                  type: SettingsItemType.modal,
                  hasDetails: true,
                ),
              ],
              header: Text('VERIZON'),
            ),
            const Padding(padding: EdgeInsets.only(top: 11.5)),
            SettingsGroup(
              <Widget>[
                SettingsItem(
                  label: 'Current Period',
                  type: SettingsItemType.modal,
                  value: '119 GB',
                ),
                SettingsItem(
                  label: 'Current Period Roaming',
                  type: SettingsItemType.modal,
                  value: '100 KB',
                ),
                SettingsItem(
                  label: 'YouTube',
                  subtitle: '50.0 GB',
                  iconAssetLabel: 'youtube',
                  type: SettingsItemType.toggle,
                  value: '100 KB',
                ),
              ],
              header: Text('CELLULAR DATA'),
            ),
          ],
        ),
      ),
    );
  }
}
