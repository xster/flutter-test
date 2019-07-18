package com.example.t130_leaf_flutter_android_support

import android.content.Context
import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.SeekBar
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.system.measureTimeMillis

class MainActivity : AppCompatActivity() {
  private lateinit var sliderChannel: MethodChannel
  private lateinit var switchChannel: MethodChannel
  private lateinit var flutterView: FlutterView

  private var flutterEngine1: FlutterEngine? = null
  private var flutterEngine2: FlutterEngine? = null

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

      create1.setOnClickListener { flutterEngine1 = (application as MyApp).flutterEngine }
      engine1.setOnClickListener { armEngine1() }
      engine2.setOnClickListener { armEngine2() }
      vm.setOnClickListener { (application as MyApp).initialize() }
    }
    Log.d("mylogs", "onCreate took $time ms")
  }

  override fun onPause() {
    if (flutterEngine2 != null) {
      flutterEngine2!!.lifecycleChannel.appIsInactive()
      flutterView.detachFromFlutterEngine()
    }
    super.onPause()
  }

  override fun onStop() {
    if (flutterEngine2 != null) {
      flutterEngine2!!.lifecycleChannel.appIsPaused()
    }
    super.onStop()
  }

  override fun onResume() {
    super.onResume()
    if (flutterEngine2 != null) {
      Log.d("mylog", "onResume took ${measureTimeMillis {
        flutterView.attachToFlutterEngine(flutterEngine2!!)
        flutterEngine2!!.lifecycleChannel.appIsResumed()
      }}")
    }
  }

  private fun armEngine1() {
    if (flutterEngine1 == null) { return }

    Log.d("mylog", "arm engine 1 ${measureTimeMillis {
      flutterEngine1!!.dartExecutor.executeDartEntrypoint(
          DartExecutor.DartEntrypoint(
            resources.assets,
            FlutterMain.findAppBundlePath(this)!!,
            "main"
          )
        )

      sliderChannel = MethodChannel(flutterEngine1!!.dartExecutor, "slider")
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
    }}")
  }

  private fun armEngine2() {
    if (flutterEngine2 != null) { return }

    Log.d("mylog", "arm engine 2 ${measureTimeMillis {
      flutterEngine2 = (application as MyApp).flutterEngine2

      switchChannel = MethodChannel(flutterEngine2!!.dartExecutor, "switch")
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

      flutterView.attachToFlutterEngine(flutterEngine2!!)
      flutterEngine2!!.lifecycleChannel.appIsResumed()
    }}")
  }

  fun update(progress: Int) {
    progressBar.progress = progress
    progressLabel.text = progress.toString()
    progressSlider.progress = progress
  }

  fun goToFlutter(view: View) {
    if (flutterEngine1 != null) {
      sliderChannel.invokeMethod("send", progressBar.progress / 100.0)
      startActivity(MyFlutterActivity.createDefaultIntent(this))
    }
  }
}

class MyFlutterActivity : FlutterActivity(), FlutterFragment.FlutterEngineProvider {
  private var start: Long = 0

  companion object {
    fun createDefaultIntent(launchingContext: Context): Intent {
      return IntentBuilder().build(launchingContext)
    }
  }

  private class IntentBuilder : FlutterActivity.IntentBuilder {
    constructor() : super(MyFlutterActivity::class.java)
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    start = System.currentTimeMillis()
    Log.d("mylog", "activity created at $start")
  }

  override fun onFirstFrameRendered() {
    super.onFirstFrameRendered()
    Log.d("mylog", "activity first render ${System.currentTimeMillis() - start}")
  }

  override fun provideFlutterEngine(context: Context): FlutterEngine? {
    return (application as MyApp).flutterEngine
  }
}

