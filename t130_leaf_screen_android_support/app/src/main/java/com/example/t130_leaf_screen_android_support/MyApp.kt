package com.example.t130_leaf_screen_android_support

import android.app.Application
import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.view.FlutterMain
import io.flutter.embedding.engine.dart.DartExecutor
import kotlin.system.measureTimeMillis

class MyApp : Application() {
  override fun onCreate() {
    super.onCreate()
    FlutterMain.startInitialization(this)
    FlutterMain.ensureInitializationComplete(this, arrayOfNulls(0))
  }

  val flutterEngine: FlutterEngine by lazy {
    lateinit var engine1: FlutterEngine
    Log.d("mylog", "engine1 took ${measureTimeMillis {
      engine1 = FlutterEngine(this).apply {
        dartExecutor.executeDartEntrypoint(
          DartExecutor.DartEntrypoint(
            resources.assets,
            FlutterMain.findAppBundlePath(this@MyApp),
            "main"
          )
        )
      }
    }}")
    engine1
  }

  val flutterEngine2: FlutterEngine by lazy {
    lateinit var engine2: FlutterEngine
    Log.d("mytag", "engine2 took ${measureTimeMillis {
      engine2 = FlutterEngine(this).apply {
        dartExecutor.executeDartEntrypoint(
          DartExecutor.DartEntrypoint(
            resources.assets,
            FlutterMain.findAppBundlePath(this@MyApp),
            "main2"
          )
        )
      }
    }}")
    engine2
  }
}
