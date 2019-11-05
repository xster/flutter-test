package com.example.t137_plugin_on_new_template_example

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.view.FlutterMain
import io.flutter.plugins.GeneratedPluginRegistrant;

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this);
    }
}