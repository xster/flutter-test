
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'page.dart';

void main() {
//  debugProfileBuildsEnabled = true;
//  debugProfilePaintsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
  runApp(new MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          textTheme: new Typography(platform: defaultTargetPlatform).white),
      home: MyPage()));
}
