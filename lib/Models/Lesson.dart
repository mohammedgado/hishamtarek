




import 'package:hishamtarek/Models/Apidto.dart';



class Lesson {
  late int Id;
  late int StudentsNo;
  late String Name ;
  String? Description ;
  late String Date ;
  late int price;
  late int MaterialId;
  late bool IsBought;
  List<Apidto>? LessonApiDto;
  Lesson({
    required this.Id,
    required this.StudentsNo,
    required this.Name,
    required this.Description,
    required this.Date,
    required this.price,
    required this.MaterialId,
    required this.IsBought,
    required this.LessonApiDto,

  });


  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      Id: json['Id'],
      StudentsNo: json['StudentsNo'],
      Name: json['Name'],
      Description: json['Description'],
      Date: json['Date'],
      price: json['price'],
      MaterialId: json['MaterialId'],
      IsBought: json['IsBought'],
      LessonApiDto: List<Apidto>.from(json["LessonApiDto"].map((x) => Apidto.fromJson(x))),

    );
  }

  Map<String, dynamic> toJson() => {
    'Id': Id,
    'StudentsNo': StudentsNo,
    'Name': Name,
    'Description': Description,
    'Date': Date,
    'price': price,
    'MaterialId': MaterialId,
    'IsBought': IsBought,


  };
}

