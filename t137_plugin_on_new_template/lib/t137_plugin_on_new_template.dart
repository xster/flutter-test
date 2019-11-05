import 'dart:async';

import 'package:flutter/services.dart';

class T137PluginOnNewTemplate {
  static const MethodChannel _channel =
      const MethodChannel('t137_plugin_on_new_template');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
