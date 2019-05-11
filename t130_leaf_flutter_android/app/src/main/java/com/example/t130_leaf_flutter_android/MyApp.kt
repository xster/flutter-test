package com.example.t130_leaf_flutter_android

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.view.FlutterMain
import io.flutter.embedding.engine.dart.DartExecutor

class MyApp : Application() {
    val flutterEngine: FlutterEngine by lazy {
        FlutterEngine(this).apply{
            dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint(
                    resources.assets,
                    FlutterMain.findAppBundlePath(this),
                    "main"
                )
            )
        }
    }
}
