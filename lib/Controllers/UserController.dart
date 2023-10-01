



import 'dart:convert';

import 'package:hishamtarek/Models/Lesson.dart';

import '../Models/Constants.dart';
import '../Models/Lecture.dart';
import '../Models/User.dart';
import 'package:http/http.dart' as http;
class UserController {
  Future<User?> Login(String email, String? password, String? imei) async {
    //todo but urls in constant
    final loginUrl =
        "${Constants
        .baseURL}/select/Login?username=$email&password=$password&imei=$imei";

    print(loginUrl);

    final response = await http.get(
        Uri.parse(loginUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      print("Login Succ in Manager");

      final jsonResponse = jsonDecode(response.body);
      //print(jsonResponse);
      try{
      User user = User.fromJson(jsonResponse);
      //print(user.name);
      return user;}
          catch(error){
        return null;
          }
      // Do something with the response
    } else {
      print("Login Falied in Manager ${response.statusCode} ");
      //throw Exception('Failed to login');
      return null;
    }
  }


  Future<User?> SignUp(User user) async {
    final url = "${Constants.baseURL}/create/CreateUser";

    print(jsonEncode(user.toJson()));
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      print("sign up Succ in Manager");

      print(user.toJson());
      return user;
      // Do something with the response
    } else {
      print("sign up Falied in Manager ${response.statusCode} ");
      //throw Exception('Failed to login');
      return null;
    }
  }


  Future<List<Lesson>> GetCourses(String UserId) async {

    final finalUri = Uri.parse( "${Constants
        .baseURL}/select/LessonsGet?lessonId=0&materialId=1&userId=$UserId");
    final response = await http.get(finalUri);
    //print(response.statusCode);
    //print(response.body);

    if (response.statusCode == 200) {
      //print("Succ Categories network Manager");
      // print(response.body);
    } else {
      print("ERROR in  CATEGORIES CALL");
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<Lesson> categories =
    data.map((item) => Lesson.fromJson(item)).toList();
    // print(categories.length);
    return categories;
  }

  Future<List<Lesson>> GetCourseDetails(String lessonId,String UserId) async {

    final finalUri = Uri.parse( "${Constants
        .baseURL}/select/LessonsGet?lessonId=${lessonId}&materialId=1&userId=$UserId");
    final response = await http.get(finalUri);
    //print(response.statusCode);
    //print(response.body);

    if (response.statusCode == 200) {
      //print("Succ Categories network Manager");
      // print(response.body);
    } else {
      print("ERROR in  CATEGORIES CALL");
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<Lesson> categories =
    data.map((item) => Lesson.fromJson(item)).toList();
    // print(categories.length);
    return categories;
  }



  Future<Lecture> GetLectureById(String LectureId) async {

    final finalUri = Uri.parse( "${Constants
        .baseURL}/select/GetLectureById?id=${LectureId}");

    final response = await http.get(finalUri);
    //print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      //print("Succ Categories network Manager");
      // print(response.body);
    } else {
      print("ERROR in  CATEGORIES CALL");
      print(response.statusCode);
    }
    final jsonResponse = jsonDecode(response.body);
    //print(jsonResponse);
    Lecture user = Lecture.fromJson(jsonResponse);
    //print(user.name);
    return user;
  }

}