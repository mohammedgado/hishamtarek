class User {
  late int Id;
  late String Username;
  late String Password;
  late String Name;
  late String Phone1;
  String? IMEI ;
  String? IMEIDesktopOnline ;

  User({
    required this.Id,
    required this.Username,
    required this.Password,
    required this.Name,
    required this.Phone1,
    required this.IMEI,
    required this.IMEIDesktopOnline

  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Id: json['Id'],
      Username: json['Username'],
      Password: json['Password'],
      Name: json['Name'],
      Phone1: json['Phone1'],
      IMEI: json['IMEI'],
      IMEIDesktopOnline: json['IMEIDesktopOnline'],

    );
  }

  Map<String, dynamic> toJson() => {
    'Id': Id,
    'Username': Username,
    'Password': Password,
    'Name': Name,
    'Phone1': Phone1,
    'Phone2': "",
    'StudentID': "",
    'Country': "",
    'Government': 0,
    'Address': "",
    'SchoolName': "",
    'UserType': 0,
    'NationalId': "",
    'Balance': 0,
    'Status': 0,
    'ExpireDate': "2040-01-01",
    'IMEI': IMEI,


  };
}