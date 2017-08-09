// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';

/// Wraps the platform's native share dialog. Can share a text and/or a URL.
/// It uses the ACTION_SEND Intent on Android and UIActivityViewController
/// on iOS.
class SharePlugin {
  static const _platformChannel =
      const PlatformMethodChannel('plugins.flutter.io/share');

  /// Summons the platform's share sheet to share text.
  ///
  /// May throw [PlatformException] or [FormatException]
  /// from [PlatformMethodChannel].
  static Future<Null> share(String text) {
    assert(text != null && text.isNotEmpty);
    return _platformChannel.invokeMethod('share', text);
  }
}
