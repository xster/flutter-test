package com.yourcompany.try15_with_plugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;

/**
 * Try15WithPlugin
 */
public class Try15WithPlugin implements MethodCallHandler {
  private FlutterActivity activity;

  public static Try15WithPlugin register(FlutterActivity activity) {
    return new Try15WithPlugin(activity);
  }

  private Try15WithPlugin(FlutterActivity activity) {
    this.activity = activity;
    new MethodChannel(activity.getFlutterView(), "try15_with_plugin").setMethodCallHandler(this);
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
