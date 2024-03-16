import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:odds/pages/appBar.dart';

class SortingHat extends StatefulWidget {
  var Api_Key = 'sk - ACDB0zPXNPNSVsFY79PMT3BlbkFJYFM5plcUKObgCWpJRpEU';

  List<Map<String, dynamic>> schoolName = [
    {
      'img': 'pracha.jpg',
      'name': 'ประชาชื่น',
    },
    {
      'img': 'burana.jpg',
      'name': 'บูรณพล',
    },
    {
      'img': 'indra.jpg',
      'name': 'อินทร',
    },
    {
      'img': 'kanok.jpg',
      'name': 'กนกประชา',
    },
  ];

  List<String> nameList = [];
  List<List<dynamic>> schoolList = [];
  int row = 4;

  SortingHat(List<String> nameList) {
    nameList.shuffle();
    this.nameList = nameList;
    schoolList = List<List>.generate(4, (i) => List<dynamic>.generate(0, (index) => null, growable: true), growable: false);

    for (int i = 0; i < nameList.length; i++) {
      schoolList[i % 4].add(nameList[i]);
    }
    schoolName.shuffle();
    // print(schoolList[0].length);
  }
  String getSchoolName(int index) {
    return schoolName[index]['name'];
  }

  int schoolIndexL = 0;

  @override
  State<SortingHat> createState() => _SortingHatState();
}

class _SortingHatState extends State<SortingHat> {
  final double boxSize = 225;

  Widget getSchoolWidget(int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => {
        setState(() {
          //   if (val > -1) {
          widget.schoolIndexL = index;
        }),
      },
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: [
            Expanded(child: Text(widget.getSchoolName(index), style: TextStyle(fontSize: 40.0, color: Colors.black))),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/' + widget.schoolName[index]['img']),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .slide(
          delay: Duration(milliseconds: 300 * index),
        )
        .fadeIn(
          duration: Duration(milliseconds: 300 * index),
        );
  }

  // Future<void> showStudentDetail(int schoolIndex, int index) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(widget.schoolList[schoolIndex][index]),
  //         content: SingleChildScrollView(
  //           child: Text('detail'),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('CLOSE'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget buildNameList(int i) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            super.widget.schoolList[i].length,
            (index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      child: Container(
                        height: 50,
                        constraints: BoxConstraints(maxWidth: 600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.person, size: 30.0, color: Colors.black),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                widget.schoolList[i][index],
                                style: TextStyle(fontSize: 30.0, color: Colors.black),
                              ),
                            ),
                            // Expanded(
                            // flex: 1,
                            // child: GestureDetector(
                            //   onTap: () {
                            //     showStudentDetail(i, index);
                            //   },
                            // child: Text(
                            //   'ดูรายละเอียด',
                            //   style: TextStyle(color: Colors.red, fontSize: 20.0, decoration: TextDecoration.underline),
                            // ),
                            // ),
                            // ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              )
                  .animate()
                  .slide(
                    delay: Duration(milliseconds: 300 * index),
                  )
                  .fadeIn(
                    duration: Duration(milliseconds: 300 * index),
                  );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: GridView(
                    shrinkWrap: true,
                    children: List.generate(super.widget.schoolList.length, (index) => getSchoolWidget(index)),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 150,
                    )),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'รายชื่อของสถาบัน',
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    Text(
                      widget.getSchoolName(widget.schoolIndexL) + ' จำนวน ' + widget.schoolList[widget.schoolIndexL].length.toString() + ' คน',
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildNameList(widget.schoolIndexL),
            ],
          ),
        ));
  }
}
