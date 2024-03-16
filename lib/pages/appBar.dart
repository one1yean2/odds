import 'package:flutter/material.dart';
import 'package:odds/pages/gamesWeb.dart';
import 'package:odds/pages/homePage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:odds/pages/video.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            );
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: const Text(
                'Form',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 28, 28, 28)),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    type: PageTransitionType.rightToLeft,
                    child: Video(),
                  ),
                );

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (_) => gamesWeb()),
                // );
              },
              child: Text(
                'Game Tic Tac Toe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 28, 28, 28)),
              ),
            ),
          ),
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 212, 43, 45),
  );
}
