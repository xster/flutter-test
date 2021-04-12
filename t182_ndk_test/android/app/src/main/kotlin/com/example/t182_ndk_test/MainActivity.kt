package com.example.t182_ndk_test

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(io.flutter.plugins.imagepicker.ImagePickerPlugin())
        flutterEngine.plugins.add(io.flutter.plugins.packageinfo.PackageInfoPlugin())
    }
}
