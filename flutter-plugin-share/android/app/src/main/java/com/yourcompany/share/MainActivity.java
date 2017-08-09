package com.yourcompany.share;

import android.os.Bundle;
import com.google.android.flutter.plugins.share.SharePlugin;
import io.flutter.app.FlutterActivity;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);

      SharePlugin.register(this);
  }
}
