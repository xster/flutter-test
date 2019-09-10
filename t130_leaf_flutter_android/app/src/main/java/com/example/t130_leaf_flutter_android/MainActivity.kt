package com.example.t130_leaf_flutter_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.view.View
import android.widget.SeekBar
import io.flutter.plugin.common.MethodChannel
import kotlinx.android.synthetic.main.activity_main.*
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngineCache

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

          update((call.arguments as Double * 100).toInt())
        }
    }
  }

  fun update(progress: Int) {
    progressBar.progress = progress
    progressLabel.text = progress.toString()
    progressSlider.progress = progress
  }

  fun goToFlutter(view: View) {
    FlutterEngineCache.getInstance().put("app instance", (application as MyApp).flutterEngine)
    channel.invokeMethod("send", progressBar.progress / 100.0)
    startActivity(FlutterActivity.withCachedEngine("app instance").build(applicationContext))
  }
}
