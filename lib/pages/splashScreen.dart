import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:odds/pages/homePage.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Animate(
        effects: [ScaleEffect(curve: Curves.ease, duration: Duration(seconds: 2)), FadeEffect(delay: Duration(seconds: 0))],
        child: Image.asset(
          'assets/images/4kingsee.png',
        ),
      ),
    )
        .animate(
          onComplete: (value) => Navigator.pushReplacement(
            context,
            PageTransition(
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
              type: PageTransitionType.rightToLeft,
              child: HomePage(),
            ),
          ),
          delay: Duration(seconds: 2),
        )
        .custom(
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          ),
        );
  }
}
