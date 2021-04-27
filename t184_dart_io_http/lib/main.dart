import 'dart:io';

import 'package:flutter/widgets.dart';

void main() async {
  final client = HttpClient();

  final request = await client.getUrl(Uri.parse("http://10.0.0.20:3000"));
  request.close();
  final response = await request.done;
  print(response.statusCode);

  runApp(SizedBox());
}