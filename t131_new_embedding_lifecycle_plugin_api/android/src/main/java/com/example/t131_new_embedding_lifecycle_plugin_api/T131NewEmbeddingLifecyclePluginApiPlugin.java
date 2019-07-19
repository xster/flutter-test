package com.example.t131_new_embedding_lifecycle_plugin_api;

import io.flutter.plugin.common.MethodCall;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** T131NewEmbeddingLifecyclePluginApiPlugin */
public class T131NewEmbeddingLifecyclePluginApiPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "t131_new_embedding_lifecycle_plugin_api");
    channel.setMethodCallHandler(new T131NewEmbeddingLifecyclePluginApiPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      result.notImplemented();
    }
  }
}
