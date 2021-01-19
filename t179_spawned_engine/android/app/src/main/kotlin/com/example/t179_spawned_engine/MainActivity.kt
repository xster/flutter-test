package com.example.t179_spawned_engine

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineGroup
import androidx.annotation.NonNull

class MainActivity: FlutterActivity() {
  override fun provideFlutterEngine(context: Context): FlutterEngine {
    val engineGroup = FlutterEngineGroup()
    engineGroup.createAndRunDefaultEngine(context)

    val secondEngine = engineGroup.createAndRunDefaultEngine(context)

    return secondEngine;
  }
}
