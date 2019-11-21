import 'dart:async';

import 'package:flutter/services.dart';

class T144TransitiveIosPlugin_2 {
  static const MethodChannel _channel =
      const MethodChannel('t144_transitive_ios_plugin_2');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static int getDartSecretNumber() => 1;
}
