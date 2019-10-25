package com.example.t136_host_sub_module

import android.os.Bundle
import android.support.annotation.NonNull
import dev.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

import io.flutter.view.FlutterMain

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        FlutterMain.startInitialization(this)
        FlutterMain.ensureInitializationComplete(this, null)
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}
