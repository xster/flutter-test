package com.example.t130_leaf_flutter_android_support

import android.content.Context
import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.SeekBar
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterView
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.system.measureTimeMillis

class MainActivity : AppCompatActivity() {
  private lateinit var sliderChannel: MethodChannel
  private lateinit var switchChannel: MethodChannel
  private lateinit var flutterView: FlutterView

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    val time = measureTimeMillis {
      setContentView(R.layout.activity_main)
      progressSlider.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
        override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
          update(progress)
        }

        override fun onStartTrackingTouch(seekBar: SeekBar?) {}

        override fun onStopTrackingTouch(seekBar: SeekBar?) {}
      })

      flutterView = FlutterView(this)
      flutterView.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
      flutterViewContainer.addView(flutterView)

      Handler().post {
        Log.d("mylog", "various hookups took ${measureTimeMillis {
          sliderChannel = MethodChannel((application as MyApp).flutterEngine.dartExecutor, "slider")
          sliderChannel.setMethodCallHandler { call, result ->
            if (call.method != "return") {
              result.notImplemented()
              return@setMethodCallHandler
            }

            if (call.arguments !is Double) {
              result.error("invalid_argument", null, null)
            }

            update((call.arguments as Double * 100).toInt())
          }

          switchChannel = MethodChannel((application as MyApp).flutterEngine2.dartExecutor, "switch")
          switchChannel.setMethodCallHandler { call, result ->
            if (call.method != "return") {
              result.notImplemented()
              return@setMethodCallHandler
            }

            if (call.arguments !is Boolean) {
              result.error("invalid_argument", null, null)
            }

            nativeSwitch.isChecked = call.arguments as Boolean
          }

          nativeSwitch.setOnCheckedChangeListener { _, isChecked ->
            switchChannel.invokeMethod("send", isChecked)
          }
        }}")
      }
    }
    Log.d("mylogs", "onCreate took $time ms")
  }

  override fun onPause() {
    flutterView.detachFromFlutterEngine()
    super.onPause()
  }

  override fun onResume() {
    super.onResume()
    Log.d("mylog", "onResume took ${measureTimeMillis {
      flutterView.attachToFlutterEngine((application as MyApp).flutterEngine2)
    }}")
  }

  fun update(progress: Int) {
    progressBar.progress = progress
    progressLabel.text = progress.toString()
    progressSlider.progress = progress
  }

  fun goToFlutter(view: View) {
    sliderChannel.invokeMethod("send", progressBar.progress / 100.0)
    startActivity(MyFlutterActivity.createDefaultIntent(this))
  }
}

class MyFlutterActivity : FlutterActivity(), FlutterFragment.FlutterEngineProvider {
  companion object {
    fun createDefaultIntent(launchingContext: Context): Intent {
      return IntentBuilder().build(launchingContext)
    }
  }

  private class IntentBuilder : FlutterActivity.IntentBuilder {
    constructor() : super(MyFlutterActivity::class.java)
  }

  override fun getFlutterEngine(context: Context): FlutterEngine? {
    return (application as MyApp).flutterEngine
  }
}

