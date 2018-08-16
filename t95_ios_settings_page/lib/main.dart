import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cellular.dart';
import 'colors.dart';
import 'group.dart';
import 'header.dart';
import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: backgroundGray,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Settings'),
            ),
            SliverSafeArea(
              top: false,
              // This is just a big list of all the items in the settings.
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    SettingsGroup(<Widget>[
                      SettingsHeader(),
                    ]),
                    SettingsGroup(<Widget>[
                      SettingsItem(
                        label: 'Airplane Mode',
                        iconAssetLabel: 'airplane',
                        type: SettingsItemType.toggle,
                      ),
                      SettingsItem(
                        label: 'Wi-Fi',
                        iconAssetLabel: 'wifi',
                        type: SettingsItemType.modal,
                        initialModalValue: 'Airport Free',
                      ),
                      SettingsItem(
                        label: 'Bluetooth',
                        iconAssetLabel: 'bluetooth',
                        type: SettingsItemType.modal,
                        initialModalValue: 'On',
                      ),
                      SettingsItem(
                        label: 'Cellular',
                        iconAssetLabel: 'cellular',
                        type: SettingsItemType.modal,
                        onPress: () => Navigator.push(context, CellularPage.route),
                      ),
                      SettingsItem(
                        label: 'Personal Hotspot',
                        iconAssetLabel: 'hotspot',
                        type: SettingsItemType.modal,
                        initialModalValue: 'Off',
                      ),
                      SettingsItem(
                        label: 'VPN',
                        iconAssetLabel: 'vpn',
                        type: SettingsItemType.modal,
                        initialModalValue: 'Not Connected',
                      ),
                    ]),
                    SettingsGroup(<Widget>[
                      SettingsItem(
                        label: 'Notifications',
                        iconAssetLabel: 'notifications',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Control Center',
                        iconAssetLabel: 'control_center',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Do Not Disturb',
                        iconAssetLabel: 'disturb',
                        type: SettingsItemType.modal,
                      ),
                    ]),
                    SettingsGroup(<Widget>[
                      SettingsItem(
                        label: 'General',
                        iconAssetLabel: 'general',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Display & Brightness',
                        iconAssetLabel: 'display',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Wallpaper',
                        iconAssetLabel: 'wallpaper',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Sounds & Haptics',
                        iconAssetLabel: 'sounds',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Siri & Search',
                        iconAssetLabel: 'siri',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Face ID & Passcode',
                        iconAssetLabel: 'face_id',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Emergency SOS',
                        iconAssetLabel: 'sos',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Battery',
                        iconAssetLabel: 'battery',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Privacy',
                        iconAssetLabel: 'privacy',
                        type: SettingsItemType.modal,
                      ),
                    ]),
                    SettingsGroup(<Widget>[
                      SettingsItem(
                        label: 'iTunes & App Store',
                        iconAssetLabel: 'itunes',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Wallet & Apple Pay',
                        iconAssetLabel: 'wallet',
                        type: SettingsItemType.modal,
                      ),
                    ]),
                    SettingsGroup(<Widget>[
                      SettingsItem(
                        label: 'Accounts & Passwords',
                        iconAssetLabel: 'accounts',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Contacts',
                        iconAssetLabel: 'contacts',
                        type: SettingsItemType.modal,
                      ),
                      SettingsItem(
                        label: 'Calendar',
                        iconAssetLabel: 'calendar',
                        type: SettingsItemType.modal,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
