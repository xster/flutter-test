import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  Intl.defaultLocale = 'zh';
  await initializeDateFormatting('zh', null);
  print(DateFormat.y().format(DateTime.now()));
  print(DateFormat.yMd().format(DateTime.now()));
  Intl.defaultLocale = 'ar';
  await initializeDateFormatting('ar', null);
  print(DateFormat.m().format(DateTime.now()));
  print(DateFormat.yMd().format(DateTime.now()));
}