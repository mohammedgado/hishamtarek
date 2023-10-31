import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/Constants.dart';
import 'package:hishamtarek/Views/CoursesView.dart';
import 'package:hishamtarek/Views/LoginView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import '../Models/Lecture.dart';
import 'SignUpView.dart';

class VideoPlayerView extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerView({Key? key,required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerView> createState() => VideoPlayerViewState();
}

class VideoPlayerViewState extends State<VideoPlayerView> {
  bool _isPlayerReady = false;
  var _playerState;
  double width = 0.0;
  double height = 0.0;
  @override
  void initState() {

    super.initState();

  }





  @override void didChangeMetrics() {
    setState(() {
      width = window.physicalSize.width;
      height = window.physicalSize.height;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: appDesign.backGround,
        body: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(1),
              child: Text("test"),
            ),
          ),
        )
    );
  }
}