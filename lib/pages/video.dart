import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:odds/pages/gamesWeb.dart';
import 'package:video_player/video_player.dart';
import 'package:page_transition/page_transition.dart';

class Video extends StatefulWidget {
  Video({Key? key}) : super(key: key);
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Video> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/videos/ttt.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setVolume(1.0);

    // if (_controller.value.isInitialized) {
    _controller.play();
    // }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller).animate(
                    onComplete: (value) => Navigator.pushReplacement(
                      context,
                      PageTransition(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                        type: PageTransitionType.rightToLeft,
                        child: gamesWeb(),
                      ),
                    ),
                    delay: Duration(seconds: 3),
                  ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
