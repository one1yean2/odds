import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'dart:convert' show utf8;

List<List<dynamic>> _data = [];
String? filePath;
void pickFile() async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  if (result != null) {
    filePath = result.files.first.path!;

    // PlatformFile file = result.files.first;

    final input = File(filePath!).openRead();
    final fields = await input.transform(utf8.decoder).transform(new CsvToListConverter()).toList();

    print(fields);
    // _data = fields;
    // setState(() {
    //   _data = fields;
    // });
  }
}
