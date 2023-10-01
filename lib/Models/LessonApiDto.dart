

class LessonApiDto {
  late int ContentType  ;
  late int ContentId ;
  late String ContentName ;
  late num ContentPrice;
  late bool IsBought;
  late String url ;

  LessonApiDto({
    required this.ContentType,
    required this.ContentId,
    required this.ContentName,
    required this.ContentPrice,
    required this.IsBought,
    required this.url

  });


  factory LessonApiDto.fromJson(Map<String, dynamic> json) {
    return LessonApiDto(
      ContentType: json['ContentType'],
      ContentId: json['ContentId'],
      ContentName: json['ContentName'],
      ContentPrice: json['ContentPrice'],
      IsBought: json['IsBought'],
      url: json['url']
    );
  }

  Map<String, dynamic> toJson() => {
    'ContentType': ContentType,
    'ContentId': ContentId,
    'ContentName': ContentName,
    'ContentPrice': ContentPrice,
    'IsBought': IsBought,
    'url': url,


  };
}

