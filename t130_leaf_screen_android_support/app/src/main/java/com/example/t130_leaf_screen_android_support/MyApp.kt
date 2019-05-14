package com.example.t130_leaf_screen_android_support

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.view.FlutterMain
import io.flutter.embedding.engine.dart.DartExecutor

class MyApp : Application() {
  override fun onCreate() {
    super.onCreate()
    FlutterMain.startInitialization(this)
    FlutterMain.ensureInitializationComplete(this, arrayOfNulls(0))
  }

  val flutterEngine: FlutterEngine by lazy {
    FlutterEngine(this).apply {
      dartExecutor.executeDartEntrypoint(
        DartExecutor.DartEntrypoint(
          resources.assets,
          FlutterMain.findAppBundlePath(this@MyApp),
          "main"
        )
      )
    }
  }
}
