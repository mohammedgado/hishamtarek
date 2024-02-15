import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/Constants.dart';
import 'package:hishamtarek/Views/CoursesView.dart';
import 'package:hishamtarek/Views/LoginView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  var _playerState;
  double width = 0.0;
  double height = 0.0;
  @override
  void initState() {

    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget!.videoUrl,
      flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          forceHD: true,
          enableCaption: false),

    )..addListener(_videoPlayerListner);
    _playerState = PlayerState.unknown;
  }


  void _videoPlayerListner() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
      });
    }
  }


  @override void didChangeMetrics() {
    setState(() {
      width = window.physicalSize.width;
      height = window.physicalSize.height;
    });
  }
  finishScreen(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    Navigator.of(context).pop();
  }

  finishScreenFromBackGesture(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop:() => finishScreenFromBackGesture(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar:AppBar(
            backgroundColor: Color(0x44000000),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: appDesign.colorAccent),
              onPressed: () =>finishScreen()

            ),
            title: const Text('Hesham Tarek',style: TextStyle(color: appDesign.colorAccent)),
          ),
          backgroundColor: appDesign.backGround,
          body: Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                child: YoutubePlayer(
                  controller: _controller,
                  liveUIColor: Colors.amber,
                  onReady: () {
                    _isPlayerReady = true;
                  },


                ),
              ),
            ),
          )
      ),
    );
  }
}