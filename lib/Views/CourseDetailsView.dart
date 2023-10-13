

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hishamtarek/Controllers/UserController.dart';
import 'package:hishamtarek/Extensions.dart';
import 'package:hishamtarek/Models/Apidto.dart';
import 'package:hishamtarek/Models/Constants.dart';
import 'package:hishamtarek/Models/Lecture.dart';
import 'package:hishamtarek/Models/Lesson.dart';
import 'package:hishamtarek/Models/LessonApiDto.dart';
import 'package:hishamtarek/Views/VideoPlayerView.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailsView extends StatefulWidget {
  final int? lessonId;

  const CourseDetailsView(
      {Key? key, this.lessonId})
      : super(key: key);

  @override
  CourseDetailsViewState createState() => CourseDetailsViewState();
}

class CourseDetailsViewState extends State<CourseDetailsView> {
  late List<Lesson>? _userModel2 = [];
  late List<Apidto>? _userModel = [];
  late List<String>? lecturesUrls = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    // From Advanced Search

    _userModel2 = (await UserController().GetCourseDetails(widget!.lessonId.toString(),UserData.userId.toString()));
    _userModel=_userModel2![0].LessonApiDto;
    setState(() {

    });
 }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:AppBar(
        backgroundColor: appDesign.colorPrimaryDark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appDesign.colorAccent),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Hisham Tarek',style: TextStyle(color: appDesign.colorAccent)),
      ),
      body:
      ListView.builder(
        shrinkWrap: true,
        cacheExtent: 1500,
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 200.0,
              child: FadeInAnimation(
                child: Card(
                    margin: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        print("${_userModel![index].toJson()} ===============");
                        /* context.navigateTo(
                                    DetailsView(ad: _userModel![index]));*/
                      },
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                //apply padding to all four sides
                                child: CachedNetworkImage(
                                  imageUrl:
                                  "https://img.youtube.com/vi/"+_userModel![index].ContentUrl!+"/0.jpg",

                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  height: context.screenHeight * 0.17,
                                )),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
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
                                                0.5),
                                        child: Text(
                                          _userModel![index]
                                              .ContentName
                                              .toString(),
                                          style: TextStyle(
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

                                            _userModel![index]
                                                .ContentPrice
                                                ==0 ? "محتوى مجاني" : ""
                                            ,
                                            style: TextStyle(
                                                color: Colors.deepOrange),
                                            textAlign: TextAlign.start,
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                      SizedBox(width: 10),
                                      Container(
                                        width: context.screenWidth*.3,
                                        child: TextButton(
                                            child: Text(
                                                "مشاهدة".toUpperCase(),
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
                                              if(_userModel![index].IsBought || _userModel![index].ContentPrice==0){
                                                if(_userModel![index].ContentType==0){
                                                context.navigateTo(
                                                    VideoPlayerView(videoUrl:_userModel![index]!.ContentUrl!))}
                                                else{
                                                  _launchUrl("http://adlink2019-001-site58.etempurl.com/homeworks/"+_userModel![index].ContentId.toString()+".pdf")
                                                }
                                              }
                                              else{
                                                context.showAlertThenWhatsApp(title: 'تنبيه',message: 'سيتم توجيهك للواتساب للانضمام')
                                              }


                                            }
                                        ),
                                      )
                                    ]
                                )


                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );

        },
      ),


    );
  }
}