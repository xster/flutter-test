import 'dart:async';
import 'dart:math';
import 'dart:ui';

Stream<int> promotions =
    new Stream.periodic(const Duration(seconds: 1), (int count) => count).asBroadcastStream();
