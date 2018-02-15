import 'dart:convert';
import 'dart:io';

main() {
  new File('pipe').openRead().transform(utf8.decoder).listen(
    (String character) {
      print(character);
    },
    onDone: () => print('StreamSubscription closing'),
  );

  IOSink writeSink = new File('pipe').openWrite();

  writeSink.write('1');
  writeSink.write('2');
  writeSink.write('3');
}