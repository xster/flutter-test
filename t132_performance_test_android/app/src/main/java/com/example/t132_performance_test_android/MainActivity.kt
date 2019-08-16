package com.example.t132_performance_test_android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.renderer.OnFirstFrameRenderedListener
import io.flutter.view.FlutterMain
import kotlin.system.measureTimeMillis

class MainActivity : AppCompatActivity() {
    private val engine: FlutterEngine by lazy {
        FlutterEngine(this.applicationContext)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun libraryLoad(view: View) {
        Log.d("test_logs", "loading the flutter library took ${measureTimeMillis {
            System.loadLibrary("flutter")
        }}")
    }

    fun engineInit(view: View) {
        Log.d("test_logs", "instantiating the engine took ${measureTimeMillis {
            engine
        }}")
    }

    fun vmInit(view: View) {
        Log.d("test_logs", "instantiating the vm took ${measureTimeMillis {
            FlutterMain.startInitialization(this.applicationContext)
            FlutterMain.ensureInitializationComplete(this, null)
        }}")
    }

    fun vmRun(view: View) {
        Log.d("test_logs", "running the entrypoint took ${measureTimeMillis {
            engine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        }}")
    }

    fun showActivity(view: View) {
        val start: Long = System.currentTimeMillis()
        val callback = object: OnFirstFrameRenderedListener {
            override fun onFirstFrameRendered() {
                Log.d("test_logs", "activity first render ${System.currentTimeMillis() - start}")
                engine.renderer.removeOnFirstFrameRenderedListener(this)
            }
        }

        engine.renderer.addOnFirstFrameRenderedListener(callback)
        FlutterEngineCache.getInstance().put("1", engine)
        startActivity(FlutterActivity.withCachedEngine("1").build(this))
    }
}
