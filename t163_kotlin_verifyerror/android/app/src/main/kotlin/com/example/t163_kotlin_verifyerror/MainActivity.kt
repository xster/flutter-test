package com.example.t163_kotlin_verifyerror

import android.os.Bundle
import android.os.PersistableBundle
import android.widget.Button
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.runBlocking

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)

//        val button = Button(this)
//
//        button.setOnClickListener { view ->
//            runBlocking {
//                print(flutterEngine.hashCode())
//            }
//        }
//
//        button.performClick()
//
//        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, "beh").setMethodCallHandler {
//            call, result ->
//            runBlocking {
//                print(flutterEngine.hashCode())
////                result.success(2)
//            }
//        }
//
//        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, "beh").invokeMethod("moo", null)
    }
//
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "beh").setMethodCallHandler {
            call, result ->
            runBlocking {
                result.success(2)
            }
        }
    }
}
