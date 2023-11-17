

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hishamtarek/Controllers/UserController.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/Constants.dart';
import 'package:hishamtarek/Models/Lesson.dart';
import 'package:hishamtarek/Views/CourseDetailsView.dart';
import 'package:hishamtarek/Views/SettingsView.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesView extends StatefulWidget {


  const CoursesView(
      {Key? key})
      : super(key: key);

  @override
  CoursesViewState createState() => CoursesViewState();
}

class CoursesViewState extends State<CoursesView> {
  late List<Lesson>? _userModel = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    // From Advanced Search

      _userModel = (await UserController().GetCourses(UserData.userId.toString()));
      print("Count IS");
      print(_userModel!.length);


    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {});
  }

  _launchWhatsapp()  {
    context.showAlertThenWhatsApp(title: 'تنبيه',message: 'سيتم توجيهك للواتساب للانضمام المحتوى');

  }
  openWhatsApp(var context) async {
    var whatsapp = "201068386732";
    var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=");
    try {
      await launchUrl(whatsappAndroid);
    } catch ( ex){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("واتساب غير محمل على هذا الجهاز"),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:AppBar(
        backgroundColor: appDesign.colorPrimaryDark,
        automaticallyImplyLeading: false,
        title: const Text('Hisham Tarek',style: TextStyle(color: appDesign.colorAccent)),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.whatsapp,color: appDesign.colorAccent),
        backgroundColor: Colors.green.shade800,
        onPressed: () {

          openWhatsApp(context);

        },
      ),
      body:
              Container(
                decoration: new BoxDecoration(
                  border: new Border.all(color: appDesign.colorAccent),
                  color: appDesign.backGround,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(

                        shrinkWrap: true,
                        cacheExtent: 1500,
                        itemCount: _userModel?.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: Container(
                                  decoration: new BoxDecoration(
                                    border: new Border.all(color: appDesign.colorAccent),
                                    color: Colors.white,
                                  ),
                                  child: Card(

                                      margin: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          print("${_userModel![index].toJson()} ===============");

                                        },
                                        child: Column(
                                          children: [

                                          Padding(
                                                  padding: EdgeInsets.all(10),
                                                  //apply padding to all four sides
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                    '${Constants.imagesURL}${_userModel![index]!.Id}.jpg',

                                                    errorWidget: (context, url, error) =>
                                                        Icon(Icons.error),
                                                    height: context.screenWidth*.8,
                                                    width: context.screenWidth*.8,
                                                  )),

                                         Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.all(10),
                                                            child: Container(
                                                              constraints: BoxConstraints(
                                                                  maxWidth:
                                                                  context.screenWidth *
                                                                      0.8),
                                                              child: Text(
                                                                _userModel![index]
                                                                    .Name
                                                                    .toString(),
                                                                style: TextStyle(
                                                                  fontSize: 20,
                                                                    color: Colors.black),
                                                                textAlign: TextAlign.start,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                maxLines: 2,
                                                                softWrap: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(10),
                                                                child: Text(

                                                                 /*     _userModel![index]
                                                                          .price
                                                                          .toString() +"جنيه"*/
                                                                  ""
                                                                     ,
                                                                  style: TextStyle(
                                                                      color: Colors.deepOrange),
                                                                  textAlign: TextAlign.start,
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(10),
                                                                child: Text(
                                                                 /* "عدد المشتركين : "+
                                                                      _userModel![index]
                                                                          .StudentsNo.toString()*/"",
                                                                  style: TextStyle(
                                                                      color: Colors.deepOrange),
                                                                  textAlign:
                                                                  TextAlign.start,
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(10),
                                                                child:  Text(
                                                                  _userModel![index]
                                                                      .Description==null?'':
                                                                  _userModel![index]
                                                                      .Description!,
                                                                  style: TextStyle(
                                                                      color: Colors.black),
                                                                  textAlign:
                                                                  TextAlign.start,
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Container(
                                                              width: context.screenWidth*.3,
                                                              child: TextButton(
                                                                  child: Text(
                                                                     _userModel![index].IsBought ?"تم الانضمام":"الانضمام",
                                                                      style: TextStyle(fontSize: 12)
                                                                  ),
                                                                  style: ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<Color>(appDesign.colorPrimary),
                                                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                                                                      foregroundColor: MaterialStateProperty.all<Color>(appDesign.colorAccent),
                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(18.0),
                                                                              side: BorderSide(color: appDesign.colorPrimary)
                                                                          )
                                                                      )
                                                                  ),
                                                                  onPressed: () =>
                                                                  _userModel![index].IsBought  ?null : _launchWhatsapp()

                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Container(
                                                              width: context.screenWidth*.3,
                                                              child: TextButton(
                                                                  child: Text(
                                                                      "دخول".toUpperCase(),
                                                                      style: TextStyle(fontSize: 12)
                                                                  ),
                                                                  style: ButtonStyle(
                                                                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                                                                      foregroundColor: MaterialStateProperty.all<Color>(appDesign.colorPrimary),
                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(18.0),
                                                                              side: BorderSide(color: appDesign.colorPrimary)
                                                                          )
                                                                      )
                                                                  ),
                                                                  onPressed: () =>
                                                                  {
                                                                  context.navigateTo(
                                                                  CourseDetailsView(lessonId: _userModel![index].Id))
                                                                  }
                                                              ),
                                                            )
                                                          ]
                                                      )
                                                    ],
                                                  ),


                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          );

                        },
                      ),
                    ),

                    Container(
                      height: 50,
                      child: Center(
                        child: GestureDetector(
                          onTap: () => context.navigateTo(SettingsView()),
                          child: Text(
                              "الإعدادات",
                              style: TextStyle(fontSize: 20,color: appDesign.colorAccent)
                          ),
                        ),
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: appDesign.colorPrimary,
                         ),
                    ),

                  ],
                ),
              ),


    );
  }
}