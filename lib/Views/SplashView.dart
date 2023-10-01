import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/Constants.dart';
import 'package:hishamtarek/Views/CoursesView.dart';
import 'package:hishamtarek/Views/LoginView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'SignUpView.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt("UserID")!=null){
      UserData.userId= prefs.getInt("UserID")!;

    }
if(UserData.userId>0){
  context.navigateFromSplash(CoursesView());
}
else{
  context.navigateFromSplash(LoginView());

}
  }


getIMEI() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    UserData.deviceIMEI=androidInfo.model;
    // Android-specific code
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    UserData.deviceIMEI=iosInfo.model;
    // iOS-specific code
  }
  else{

  }

}



  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), () {
      _getUser();
    });

    return Scaffold(
        backgroundColor: appDesign.backGround,
        body: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset("images/applogo.jpg"),
            ),
          ),
        )
    );
  }
}