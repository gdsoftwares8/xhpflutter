
class LoginModel {
  int status;
  String message;
  String userID;
  bool isVerified = false;
  bool blocked = false;
  bool deleted = false;
  String pwResetToken;
  String pwResetOTP;
  int id;
  String name;
  String email;
  String phone;
  String password;
  String loginToken;


  LoginModel.fromJson(Map<String, dynamic> json) {
    try {
      print("json reg $json");
      this.status = json['Status'];
      this.message = json['Message'];
      this.userID = json['Data']['userID'];
      this.isVerified = json['Data']['isVerified'];
      this.blocked = json['Data']['blocked'];
      this.deleted = json['Data']['deleted'];
      this.pwResetToken = json['Data']['pwResetToken'];
      this.pwResetOTP = json['Data']['pwResetOTP'];
      this.id = json['Data']['id'];
      this.name = json['Data']['name'];
      this.email = json['Data']['email'];
      this.phone = json['Data']['phone'];
      this.password = json['Data']['password'];
      this.loginToken = json['Data']['loginToken'];
    } catch (e) {
      print('Exception in CompanyModel $e');
    }
  }
}
