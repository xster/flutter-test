package dev.flutter.example.t175_multiple_engines;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;

public class MainActivity extends AppCompatActivity {
  SeekBar engineQuantitySeekBar;
  Button launchFlutterButton;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    engineQuantitySeekBar = findViewById(R.id.seekBar);
    launchFlutterButton = findViewById(R.id.button);

    launchFlutterButton.setOnClickListener((View view) -> {
      Intent flutterIntent = new Intent(this, MultipleFlutterActivity.class);
      flutterIntent.putExtra("number", engineQuantitySeekBar.getProgress());
      startActivity(flutterIntent);
    });
  }
}