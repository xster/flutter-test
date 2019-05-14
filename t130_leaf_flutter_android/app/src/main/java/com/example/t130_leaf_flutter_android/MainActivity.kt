package com.example.t130_leaf_flutter_android

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.view.View
import android.widget.SeekBar
import io.flutter.plugin.common.MethodChannel
import kotlinx.android.synthetic.main.activity_main.*
import io.flutter.embedding.engine.FlutterEngine
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment.FlutterEngineProvider

class MainActivity : AppCompatActivity() {
  private lateinit var channel: MethodChannel

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_main)
    progressSlider.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
      override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
        update(progress)
      }

      override fun onStartTrackingTouch(seekBar: SeekBar?) {}

      override fun onStopTrackingTouch(seekBar: SeekBar?) {}
    })

    Handler().post {
      channel = MethodChannel((application as MyApp).flutterEngine.dartExecutor, "slider")
      channel.setMethodCallHandler { call, result ->
          if (call.method != "return") {
            result.notImplemented()
            return@setMethodCallHandler
          }

          if (call.arguments !is Double) {
            result.error("invalid_argument", null, null)
          }

          update((call.arguments as Double * 100) as Int)
        }
    }
  }

  fun update(progress: Int) {
    progressBar.progress = progress
    progressLabel.text = progress.toString()
    progressSlider.progress = progress
  }

  fun goToFlutter(view: View) {
    channel.invokeMethod("send", progressBar.progress / 100.0)
  }
}

class MyFlutterActivity : FlutterActivity(), FlutterEngineProvider {
  companion object {
    fun createDefaultIntent(launchingContext: Context): Intent {
      return IntentBuilder().build(launchingContext)
    }
  }

  private class IntentBuilder : FlutterActivity.IntentBuilder {
    constructor() : super(MyFlutterActivity::class.java)
  }

  override fun getFlutterEngine(context: Context): FlutterEngine? {
//    return (application as MyApp).flutterEngine
    return null
  }
}

