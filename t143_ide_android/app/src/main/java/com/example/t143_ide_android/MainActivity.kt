package com.example.t143_ide_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import io.flutter.embedding.android.FlutterActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun showFlutter(view: View) {
        startActivity(FlutterActivity.createDefaultIntent(this))
    }
}
