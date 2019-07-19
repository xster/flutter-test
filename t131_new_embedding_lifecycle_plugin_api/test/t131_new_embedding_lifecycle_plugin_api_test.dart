import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:t131_new_embedding_lifecycle_plugin_api/t131_new_embedding_lifecycle_plugin_api.dart';

void main() {
  const MethodChannel channel = MethodChannel('t131_new_embedding_lifecycle_plugin_api');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await T131NewEmbeddingLifecyclePluginApi.platformVersion, '42');
  });
}
