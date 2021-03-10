import 'dart:developer';

class User {
  bool gender = false;
  bool isVerified = false;
  String id;
  String name;
  String email;
  String phone;
  String loginToken;

  User( {
    this.id, this.name, this.email, this.phone
  });

  User.fromJson(Map<String, dynamic> json) {
    try {
      log("json reg $json");
      this.id = json['userID'];
      this.isVerified = json['isVerified'];
      this.name = json['name'];
      this.email = json['email'];
      this.phone = json['phone'];
      this.loginToken = json['loginToken'];
    } catch (e) {
      print('Exception in UserModel $e');
    }
  }

  Map<String, dynamic> toJson() => {
    'userID': id,
    'isVerified': isVerified,
    'name': name,
    'email': email,
    'phone': phone,
    'loginToken': loginToken,
  };
}
