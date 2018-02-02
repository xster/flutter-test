package com.yourcompany.t33animationwithnative;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String PLATFORM_CHANNEL = "t33.test.flutter.io/native";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), PLATFORM_CHANNEL)
        .setMethodCallHandler(
          new MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall call, Result result) {
              Intent intent = new Intent(MainActivity.this, SecondActivity.class);
              startActivity(intent);
            }
          }
        );
  }
}
