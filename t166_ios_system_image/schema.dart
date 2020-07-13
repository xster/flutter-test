import 'dart:typed_data';

import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class HostImageApi {
  Uint8List getSystemImageData(String name);
}