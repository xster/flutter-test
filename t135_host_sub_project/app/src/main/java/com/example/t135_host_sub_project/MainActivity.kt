package com.example.t135_host_sub_project

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.view.FlutterMain


class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        FlutterMain.startInitialization(this)
        FlutterMain.ensureInitializationComplete(this, null)
        super.onCreate(savedInstanceState)
    }
}
