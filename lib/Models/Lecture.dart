







class Lecture {
   int? Id;
   int? UserId;
   int? MaterialId ;
   String? Name ;
   String? Date ;
   String? Url ;
   int? Price;
   bool? IsBought;
   String? DependancyName ;
   int? DependancyId ;
   int? DependancyType ;
   bool? isDependancyBuyed ;

  Lecture({
     this.Id,
     this.UserId,
     this.MaterialId,
     this.Name,
     this.Date,
     this.Url,
     this.Price,
     this.IsBought,
     this.DependancyName,
     this.DependancyId,
     this.DependancyType,
     this.isDependancyBuyed

  });


  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      Id: json['Id'],
      UserId: json['UserId'],
      MaterialId: json['MaterialId'],
      Name: json['Name'],
      Date: json['Date'],
      Url: json['Url'],
      Price: json['Price'],
      IsBought: json['IsBought'],
        DependancyName: json['DependancyName'],
        DependancyId: json['DependancyId'],
        DependancyType: json['DependancyType'],
        isDependancyBuyed: json['isDependancyBuyed']
    );
  }


}

