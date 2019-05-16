import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'inline_view.dart';
import 'page_view.dart';

void main() {
  print('starting engine 1');
  runApp(defaultTargetPlatform == TargetPlatform.iOS
    ? CupertinoApp(home: MyApp())
    : MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: MyApp(),
    ));
}

@pragma('vm:entry-point')
void main2() {
  print('starting engine 2');
  print(window.physicalSize);
  runApp(defaultTargetPlatform == TargetPlatform.iOS
    ? CupertinoApp(home: MySwitch(), debugShowCheckedModeBanner: false)
    : MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: MySwitch(),
    ));
}


