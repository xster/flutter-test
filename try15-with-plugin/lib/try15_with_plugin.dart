import 'dart:async';

import 'package:flutter/services.dart';

class Try15WithPlugin {
  static const MethodChannel _channel =
      const MethodChannel('try15_with_plugin');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');
}
