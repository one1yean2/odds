import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:odds/pages/appBar.dart';
import 'package:odds/pages/nameForm.dart';
import 'package:odds/pages/sortingHat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      setState(() {
        _data = fields;
      });
    }
  }

  void _updatePeopleNumber(int val) {
    setState(() {
      peopleNumber = val;
    });
  }

  NameForm nf = new NameForm(0);
  int peopleNumber = 0;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/4kingslogo.png',
              ).animate().shake(duration: 5000.ms, hz: 0.5),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _textController,
                  onChanged: (val) {
                    _updatePeopleNumber(int.parse(val));
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'จำนวนคนทั้งหมด',
                    prefixIcon: Icon(Icons.onetwothree),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _updatePeopleNumber(0);
                        _textController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ).animate(delay: Duration(milliseconds: 1000)).slideY().fadeIn(),
              ),
              nf = new NameForm(peopleNumber),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 50,
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.red[600],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      if (nf.checkNameList() || peopleNumber == 0) {
                        showDialog<void>(
                          context: context,
                          // barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog.adaptive(
                              title: Center(child: Text('ใส่ชื่อไม่ครบ')),
                            ).animate(
                              delay: Duration(seconds: 1),
                              onComplete: (controller) => Navigator.pop(context),
                            );
                          },
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => SortingHat(nf.getNameList())),
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ).animate(delay: Duration(milliseconds: 1250)).slideY().fadeIn(),
              SizedBox(
                height: 10,
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
