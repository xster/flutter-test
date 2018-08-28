import 'dart:async';
import 'dart:math';
import 'dart:ui';

Stream<int> promotions =
    new Stream.periodic(const Duration(seconds: 1), (int count) => count).asBroadcastStream();

Random random = new Random();

Color getRandomColor() => new Color.fromARGB(0xFF, 200 + random.nextInt(55),
    200 + random.nextInt(55), 200 + random.nextInt(55));
