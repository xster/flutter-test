package com.example.t133_android_test_without_facade

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.view.FlutterMain

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        FlutterMain.startInitialization(applicationContext)
        super.onCreate(savedInstanceState)
    }
}
