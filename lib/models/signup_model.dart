class SignUp {
  String membershipNo;
  String title;
  String firstName;
  String lastName;
  String middleName;
  String email;
  String username;
  String mobileNo;
  String profilePic;
  String dob;
  String otp;
  String regOtp;
  String tPin;
  String petName;
  String xhpAuthority;
  String password;

  SignUp(
      {this.membershipNo,
      this.title,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.username,
      this.mobileNo,
      this.profilePic,
      this.dob,
      this.otp,
      this.regOtp,
      this.tPin,
      this.petName,
      this.xhpAuthority,
      this.password});

  SignUp.fromJson(Map<String, dynamic> json) {
    membershipNo = json['membership_no'];
    title = json['title'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    email = json['email'];
    username = json['username'];
    mobileNo = json['mobile_no'];
    profilePic = json['profile_pic'];
    dob = json['dob'];
    otp = json['otp'];
    regOtp = json['reg_otp'];
    tPin = json['t_pin'];
    petName = json['pet_name'];
    xhpAuthority = json['xhp_authority'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['membership_no'] = this.membershipNo;
    data['title'] = this.title;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['mobile_no'] = this.mobileNo;
    data['profile_pic'] = this.profilePic;
    data['dob'] = this.dob;
    data['otp'] = this.otp;
    data['reg_otp'] = this.regOtp;
    data['t_pin'] = this.tPin;
    data['pet_name'] = this.petName;
    data['xhp_authority'] = this.xhpAuthority;
    data['password'] = this.password;
    return data;
  }
}
