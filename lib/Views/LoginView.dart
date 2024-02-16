



import 'dart:io';

import 'package:device_imei/device_imei.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Views/CoursesView.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/UserController.dart';
import '../Models/Constants.dart';
import '../rounded_loading_button.dart';
import 'Shared/authTextField.dart';
import 'SignUpView.dart';
class LoginView extends StatefulWidget {
  //constructor
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  final controller = UserController();
  final RoundedLoadingButtonController _loginBtnController =
  RoundedLoadingButtonController();
  var isLoading = false;
  var email;
  var pass;
  String? deviceImei="";
  String? type;
  bool getPermission = false;
  @override
 initState()  {
    super.initState();
    getIMEI();
    //
  }


  getIMEI() async {
   // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
   // IosDeviceInfo info = await deviceInfo.iosInfo;
    UserData.deviceIMEI="";

  }




  void loginValidation(RoundedLoadingButtonController btnController) {
    if (email == null  || pass == null) {
      context.showAlert(
          title: "تنبيه",
          message: "من فضلك ادخل جميع الحقول المطلوبة");
      btnController.reset();
    } else {
      controller.Login(email, pass,deviceImei).then((value) async {
        if (value != null) {
        //  if(value.IMEI==UserData.deviceIMEI){
            print("User IS ${value} *************************");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setInt("UserID", value.Id);
            prefs.setString("UserName", value.Username);
            UserData.userId=value.Id;
            UserData.userName=value.Username;
            context.navigateTo(CoursesView());
       /*   }
          else {
            context.showAlert(
                title: "تنبيه",
                message: "هذا جهاز مختلف عن المسجل للحساب");
            btnController.reset();
          }*/

        } else {
          context.showAlert(
              title: "تنبيه",
              message: "اسم مستخدم او كلمة مرور غير صحيحة");
          btnController.reset();
        }
      });
    }

    // Send the email and password to your backend for authentication
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appDesign.backGround,
      body: SingleChildScrollView(
        child: Padding(
          // add space for all padding container
          padding: EdgeInsets.all(20),
          child: Container(
            height: context.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Spacer(flex: 1),
                Image.asset('images/applogo.jpg',width: 128,height: 128 ,),
                Spacer(flex: 2),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                      child: AuthTextField(
                          labelText: "رقم التليفون",
                          obscureText: false,
                          onChanged: (text) {
                            email = text;
                          }),

                  ),
                  flex: 3,
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: AuthTextField(
                        labelText: "كلمة المرور",
                        obscureText: true,
                        onChanged: (text) {
                          pass = text;
                        },
                      ),
                    ),
                    flex: 3),
                Spacer(),
                Expanded(
                  child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            context.screenWidth * 0.15,
                            context.screenHeight * 0.02,
                            context.screenWidth * 0.15,
                            0),
                        child: RoundedLoadingButton(
                          controller: _loginBtnController,
                          color: appDesign.colorPrimary,
                          successIcon: Icons.cloud,
                          failedIcon: Icons.error,
                          child: Text(
                           "تسجيل دخول",
                            style: TextStyle(
                              color: Color(0xfff6f6f6),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          onPressed: () => loginValidation(_loginBtnController),
                        ),
                      )),
                  flex: 3,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextButton(
                        onPressed: () {
                          context.navigateTo(SignUpView());
                        },
                        child: Text("لا تملك حساباً ؟ اضغط هنا للتسجيل",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: appDesign.colorPrimary,
                            )),
                      )
                    ],
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextButton(
                        onPressed: () {
                          context.navigateTo(SignUpView());
                        },
                        child: Text("هل تواجه مشكلة ؟ تواصل معنا على 01068386732",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: appDesign.colorPrimary,
                            )),
                      )
                    ],
                  ),
                  flex: 2,
                ),
                Spacer(
                  flex: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
