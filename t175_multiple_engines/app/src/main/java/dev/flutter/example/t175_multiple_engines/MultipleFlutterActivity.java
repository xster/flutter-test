package dev.flutter.example.t175_multiple_engines;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;

import io.flutter.embedding.android.FlutterFragment;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.FlutterEngineGroup;

public class MultipleFlutterActivity extends FragmentActivity {
  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    Intent intent = getIntent();
    int numberOfFlutters = intent.getIntExtra("number", 10);

    LinearLayout root = new LinearLayout(this);
    root.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT));
    root.setOrientation(LinearLayout.VERTICAL);
    root.setWeightSum(numberOfFlutters);

    FragmentManager fragmentManager = getSupportFragmentManager();

    setContentView(root);

    FlutterEngineGroup flutterEngineGroup = new FlutterEngineGroup();

    for (int i = 0; i < numberOfFlutters; i++) {
      FrameLayout flutterContainer = new FrameLayout(this);
      root.addView(flutterContainer);
      flutterContainer.setId(12345 + i);
      flutterContainer.setLayoutParams(new LinearLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT, 1));

      FlutterEngine engine = flutterEngineGroup.createAndRunDefaultEngine(this);
      FlutterEngineCache.getInstance().put(String.valueOf(i), engine);

      FlutterFragment flutterFragment = FlutterFragment.withCachedEngine(String.valueOf(i)).build();

      fragmentManager
          .beginTransaction()
          .add(
              12345 + i,
              flutterFragment)
          .commit();
    }
  }
}
