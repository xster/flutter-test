import 'dart:async';

import 'package:flutter/services.dart';
import 'package:t144_transitive_ios_plugin_2/t144_transitive_ios_plugin_2.dart';

class T144TransitiveIosPlugin {
  static const MethodChannel _channel =
      const MethodChannel('t144_transitive_ios_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    print(T144TransitiveIosPlugin_2.getDartSecretNumber());
    return version;
  }
}
