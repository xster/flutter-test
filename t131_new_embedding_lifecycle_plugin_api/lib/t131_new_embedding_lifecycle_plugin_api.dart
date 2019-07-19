import 'dart:async';

import 'package:flutter/services.dart';

class T131NewEmbeddingLifecyclePluginApi {
  static const MethodChannel _channel =
      const MethodChannel('t131_new_embedding_lifecycle_plugin_api');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
