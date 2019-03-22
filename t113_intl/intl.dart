import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  Intl.defaultLocale = 'en';
  await initializeDateFormatting('en', null);
  print('English');
  testStuff();
  Intl.defaultLocale = 'zh_CN';
  await initializeDateFormatting('zh_CN', null);
  print('Chinese');
  testStuff();
  Intl.defaultLocale = 'ar';
  await initializeDateFormatting('ar', null);
  print('Arabic');
  testStuff();
  Intl.defaultLocale = 'ko';
  await initializeDateFormatting('ko', null);
  print('Korean');
  testStuff();
}

void testStuff() {
  print(DateFormat.y().format(DateTime.utc(1995)));
  print(DateFormat.MMMM().format(DateTime.now()));
  print(DateFormat.MMMEd().format(DateTime.now()));
  print(DateFormat.d().format(DateTime.utc(0, 0, 4)));
  print(DateFormat.H().format(DateTime.utc(0, 0, 0, 13)));
  print(DateFormat('HH').format(DateTime.utc(0, 0, 0, 4)));
  print(DateFormat().add_H().format(DateTime.utc(0, 0, 0, 4)));
  print('\n\n');
}