import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

const String separator = '--------------------------------------------------------------------------------';
final RegExp blankLine = RegExp(r'^\s*$', multiLine: true);

// Use as few dependencies as possible.
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printUsage();
  }

  if (arguments[0] == '--encode') {
    if (arguments.length == 1 || arguments.length > 3) {
      printUsage();
    }
    var file = arguments[1];
    var original = File(file).readAsStringSync();
    var summarize = arguments.last == '--summarize';
    encode(original, summarize: summarize);
  } else if (arguments[0] == '--decode') {
    if (arguments.length == 1 || arguments.length > 2) {
      printUsage();
    }
    var file = arguments[1];
    var encodedFile = File(file).readAsStringSync();
    decode(encodedFile);
  } else if (arguments[0] == '--zip') {
    if (arguments.length == 1 || arguments.length > 2) {
      printUsage();
    }
    var file = arguments[1];
    var encodedFile = File(file).readAsBytesSync();
    zip(encodedFile);
  } else {
    printUsage();
  }
}

void printUsage() {
  print("Encodes or decodes Flutter's NOTICE file for size reduction.\n");
  print('Usage:');
  print('  --encode [NOTICE file]: produces a smaller NOTICE file with encoding');
  print('    --summarize: prints encoding stats instead of the encoded file');
  print('  --decode [encoded NOTICE file]: recreates the original NOTICE file');
  exit(1);
}

void encode(String originalLicense, { bool summarize=false }) {
  var list = originalLicense.split(separator);
  var libraryList = <String>[];
  var authorList = <String>[];
  var licenseList = <String>[];

  var output = StringBuffer();

  for (var section in list) {
    var paragraphs = section.split(blankLine);

    var library = paragraphs.removeAt(0);
    var libraryKey = getIndexOrInsert(libraryList, library);

    output.write('{{$libraryKey}}');

    var author = paragraphs.removeAt(0);
    var authorKey = getIndexOrInsert(authorList, author);

    output.write('{{$authorKey}}');

    var license = paragraphs.join('\n');
    var licenseKey = getIndexOrInsert(licenseList, license);

    output.write('{{$licenseKey}}');
  }

  output.writeln('\n{{{mapping}}}');
  libraryList.asMap().forEach((index, library) {
    output.write('{{{a$index}}}$library');
  });
  authorList.asMap().forEach((index, author) {
    output.write('{{{b$index}}}$author');
  });
  licenseList.asMap().forEach((index, license) {
    output.write('{{{c$index}}}$license');
  });
  output.writeln('{{{end}}}');

  if (summarize) {
    print('Total licenses: ${list.length}');
    print('${libraryList.length} unique libraries');
    print('${authorList.length} unique authors');
    print('${licenseList.length} unique licenses');
  } else {
    // print(output.toString());
    zip(utf8.encode(output.toString()));
  }
}

void decode(String encodedLicense) {
  var mappingLocation = encodedLicense.indexOf('{{{mapping}}}');
  if (mappingLocation < 0) {
    print('Invalid NOTICE encoding');
    exit(2);
  }
}

void zip(Uint8List originalLicense) {
  File('out/NOTICE.gz').writeAsBytesSync(gzip.encode(originalLicense));
}

int getIndexOrInsert(List<String> list, String string) {
  var index = list.indexOf(string);
  if (index < 0) {
    index = list.length;
    list.add(string);
  }
  return index;
}