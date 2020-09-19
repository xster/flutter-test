package com.example.t173_flutteractivity_stack

import android.app.Activity
import android.os.Bundle
import android.util.Log
import android.view.Gravity
import android.widget.Button
import android.widget.FrameLayout
import android.widget.FrameLayout.LayoutParams
import androidx.lifecycle.Lifecycle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity : Activity() {
  lateinit var engine: FlutterEngine

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    engine = FlutterEngine(this);
    engine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
    FlutterEngineCache.getInstance().put("shared engine", engine);

    val button = Button(this)
    button.text = "Launch Flutter"

    val frameLayout = FrameLayout(this)
    setContentView(frameLayout)

    frameLayout.addView(
        button,
        LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT, Gravity.CENTER))

    button.setOnClickListener {
      startActivity(
          FlutterActivity.CachedEngineIntentBuilder(StackedFlutterActivity::class.java, "shared engine").build(this))
    }


  }
}

class StackedFlutterActivity: FlutterActivity() {
  override fun onResume() {
    super.onResume()
    Api.AndroidApi.setup(flutterEngine!!.dartExecutor) {
      if (lifecycle.currentState == Lifecycle.State.RESUMED) {
        startActivity(
            FlutterActivity.CachedEngineIntentBuilder(StackedFlutterActivity::class.java, "shared engine").build(this))
      }
    }
  }
}
