

class Apidto {
  late int ContentType  ;
  late int ContentId ;
  late String ContentName ;
  late num ContentPrice;
  late bool IsBought;
  String? ContentUrl;
  Apidto({
    required this.ContentType,
    required this.ContentId,
    required this.ContentName,
    required this.ContentPrice,
    required this.IsBought,
    this.ContentUrl

  });


  factory Apidto.fromJson(Map<String, dynamic> json) {
    return Apidto(
        ContentType: json['ContentType'],
        ContentId: json['ContentId'],
        ContentName: json['ContentName'],
        ContentPrice: json['ContentPrice'],
        IsBought: json['IsBought'],
      ContentUrl: json['ContentUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'ContentType': ContentType,
    'ContentId': ContentId,
    'ContentName': ContentName,
    'ContentPrice': ContentPrice,
    'IsBought': IsBought,
    'ContentUrl': ContentUrl

  };
}

