import 'dart:async';

import 'package:flutter/services.dart';

class T23Podfile {
  static const MethodChannel _channel =
      const MethodChannel('t23_podfile');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');
}
