



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Constants.dart';
import '../Controllers/UserController.dart';
import 'LoginView.dart';
import 'Shared/authTextField.dart';
import 'package:restart_app/restart_app.dart';
class SettingsView extends StatefulWidget {


  //constructor
  SettingsView({Key? key}) : super(key: key);

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {




  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(88, 50),
      backgroundColor: appDesign.colorPrimaryDark,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
    return Scaffold(
      appBar:AppBar(
        backgroundColor: appDesign.colorPrimaryDark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appDesign.colorAccent),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Hesham Tarek',style: TextStyle(color: appDesign.colorAccent)),
      ),
      backgroundColor: appDesign.backGround,
      body: SingleChildScrollView(
        child: Padding(
          // add space for all padding container
          padding: EdgeInsets.all(context.screenWidth * 0.0),
          child: Container(
            height: context.screenHeight + 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                SizedBox(height: context.screenHeight * 0.1),
                Center(child: Image.asset('images/applogo.jpg',width: context.screenWidth*.5,height: context.screenWidth*.5 ,)),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10,70,10,10),
                  child: Container(
                    width: context.screenWidth,
                    child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setInt("UserID", 0);
                        prefs.setString("UserName", "");
                        UserData.userName="";
                        UserData.userId=0;
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => LoginView(),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );

                      },
                      child: Text('تسجيل خروج',style: TextStyle(fontSize: 25,color: appDesign.colorAccent)),
                    ),
                  )
                  ,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,70,10,10),
                  child: Container(
                    width: context.screenWidth,
                    child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setInt("UserID", 0);
                        prefs.setString("UserName", "");
                        UserData.userName="";
                        UserData.userId=0;
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => LoginView(),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );


                      },
                      child: Text('حذف الحساب',style: TextStyle(fontSize: 25,color: appDesign.colorAccent)),
                    ),
                  )
                  ,
                )






                //SizedBox(height: context.screenHeight * 0.02),


                //SizedBox(height: context.screenHeight * 0.01),

                //SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}