package com.example.t154_android_crashlytics

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.crashlytics.android.Crashlytics
import io.flutter.embedding.android.FlutterActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun onCrash(view: View) {
        Crashlytics.getInstance().crash()
    }

    fun runFlutter(view: View) {
        startActivity(FlutterActivity.createDefaultIntent(this))
    }
}
