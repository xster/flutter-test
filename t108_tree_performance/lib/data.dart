import 'dart:async';
import 'dart:math';
import 'dart:ui';

Stream<int> promotions =
    new Stream.periodic(const Duration(seconds: 1), (int count) => count).asBroadcastStream();

Random random = new Random();

Color getRandomColor() => new Color.fromARGB(0xFF, 100 + random.nextInt(155),
    100 + random.nextInt(155), 100 + random.nextInt(155));
