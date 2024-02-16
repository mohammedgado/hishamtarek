



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/User.dart';
import '../Models/Constants.dart';
import '../Controllers/UserController.dart';
import '../rounded_loading_button.dart';
import 'LoginView.dart';
import 'Shared/authTextField.dart';

class SignUpView extends StatefulWidget {
   String? email;
   String? name;

  //constructor
  SignUpView({Key? key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUpView> {
  final controller = UserController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final RoundedLoadingButtonController _signUpBtnController =
  RoundedLoadingButtonController();
  var isLoading = false;
  var name;
  String password = "";
  String email = "";
  var number;



  @override
  void initState() {
    _signUpBtnController.start();
    super.initState();
  }


  void signUpValidation(RoundedLoadingButtonController btnController) {

    if (number.toString().isValidNumber()) {
      print("IS VAlid NUMBER ++++++++++");
    }else{
      print("NOOOT VAlid NUMBER ++++++++++");
    }


    if (name == null ||
        password == null ||
        number == null ||
        email == null) {
      btnController.reset();
      context.showAlert(
          title:"تنبيه",
          message:"من فضلك ادخل جميع الحقول المطلوبة");
    } else if (name != null  && password != null) {
       if (!number.toString().isValidNumber()) {
        context.showAlert(
            title: "تنبيه",
            message:"ادخل رقم هاتف صحيح");
        btnController.reset();
      }
       if(email.length>0){
      if (

          number.toString().isValidNumber()) {

        print("now we can add to data base");

        // print("Selected town befor go");
        //print(selectedTownObj!.toJson());
        controller
            .SignUp(
            new User(Id: 0, Username: name, Password: password, Name:name,Phone1: number,SchoolName:email,IMEIDesktopOnline: null,IMEI: null))
            .then((user) {
          if (user != null) {
            btnController.success();
            //context.saveUser(user);
            Future.delayed(Duration(seconds: 2));
            context.navigateTo(LoginView());
            //context.navigateTo(bottom app bar);
          } else {
            btnController.error();
            context.showAlert(
                title: "تنبيه",
                message: "مستخدم موجود بالفعل");
            btnController.reset();
          }
        });
      } else {
        print("Enter Else ");
      }}
       else{
         context.showAlert(
             title: "تنبيه",
             message: "برجاء ادخال البريد الالكتروني");
         btnController.reset();
       }
    }

    // Send the email and password to your backend for authentication
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name != null) {
      nameController.text = widget.name.toString();
      emailController.text = widget.email.toString();
      name = widget.name.toString();
      email = widget.email.toString();
    }
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
              children: <Widget>[
                SizedBox(height: context.screenHeight * 0.1),
                Image.asset('images/applogo.jpg',width: context.screenWidth*.25,height: context.screenWidth*.25 ,),

                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: AuthTextField(
                      controller: nameController,
                      labelText: "الاسم",
                      obscureText: false,
                      onChanged: (text) {
                        name = text;
                      },
                    ),
                  ),

                // SizedBox(height: context.screenHeight * 0.025),
            Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: AuthTextField(
                        labelText: "كلمة المرور",
                        obscureText: true,
                        onChanged: (text) {
                          password = text;
                        },
                      ),
                    ),



                   Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: AuthTextField(
                      labelText: "رقم التليفون",
                      obscureText: false,
                      onChanged: (text) {
                        number = text;
                      },
                    ),
                  ),

                 Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: AuthTextField(
                      controller: emailController,
                      labelText: "البريد الإلكتروني",
                      obscureText: false,
                      onChanged: (text) {
                        email = text;
                      },
                    ),
                  ),


            SizedBox(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            context.screenWidth * 0.15,
                            context.screenHeight * 0.02,
                            context.screenWidth * 0.15,
                            0),
                        child: RoundedLoadingButton(
                          controller: _signUpBtnController,
                          color: appDesign.colorPrimary,
                          successIcon: Icons.cloud,
                          failedIcon: Icons.error,
                          child: Text(
                            "تسجيل حساب جديد",
                            style: TextStyle(
                              color: Color(0xfff6f6f6),
                              fontWeight: FontWeight.w600,
                                fontSize: 20
                            ),
                          ),
                          onPressed: () => signUpValidation(_signUpBtnController),
                        ),
                      )),

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