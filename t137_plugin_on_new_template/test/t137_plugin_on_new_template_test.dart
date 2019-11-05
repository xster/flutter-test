import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:t137_plugin_on_new_template/t137_plugin_on_new_template.dart';

void main() {
  const MethodChannel channel = MethodChannel('t137_plugin_on_new_template');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await T137PluginOnNewTemplate.platformVersion, '42');
  });
}
