import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NameForm extends StatefulWidget {
  List<String> nameList = [];
  int peopleNumber = 0;

  NameForm(int peopleNumber) {
    if (peopleNumber > 0) {
      this.peopleNumber = peopleNumber;
      nameList = List.generate(peopleNumber, (index) => '');
    }
  }

  List<String> getNameList() {
    return nameList;
  }

  bool checkNameList() {
    bool notComplete = false;
    for (int i = 0; i < nameList.length; i++) {
      if (nameList[i].isEmpty) {
        return notComplete = true;
      }
    }
    return notComplete;
  }

  @override
  State<NameForm> createState() => _NameForm();
}

class _NameForm extends State<NameForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            setState(() {
              Form.of(primaryFocus!.context!)!.save();
            });
          },
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: List.generate(
              super.widget.peopleNumber,
              (index) {
                return Animate(
                  effects: [SlideEffect(), FadeEffect()],
                  delay: Duration(milliseconds: 300 * index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: 700,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'ชื่อคนที่ ' + (index + 1).toString(),
                              prefixIcon: Icon(Icons.abc),
                              prefixIconColor: Colors.red,
                              fillColor: Colors.green,
                            ),
                            onSaved: (String? value) {
                              if (value != null) {
                                widget.nameList[index] = value;
                                // print(widget.nameList);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
