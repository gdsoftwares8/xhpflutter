class User{
String membershipno;
String title;
String firstname;
String lastname;
String middlename;
String username ;
String email;
bool signupstatus;
String password;
String mobileno;
String referralcode;
String uniquecode;
String profilepic;
String dob;
String otp;
String petname;
String xhpauthority;
String paymentchoice;

User();

  User.fromJson(Map<String, dynamic> json) {
    try {
      this.membershipno = json['membership_no'];
      this.title = json['title'];
      this.firstname = json['first_name'];
      this.lastname = json['last_name'];
      this.middlename = json['middle_name'];
      this.username=json['username'];
      this.email = json['email'];
      this.signupstatus=json['signup_status'];
      this.password=json['password'];
      this.mobileno=json['mobile_no'];
      this.referralcode=json['referral_code'];
      this.profilepic=json['profile_pic'];
      this.uniquecode=json['unique_code'];
      this.otp=json['otp'];
      this.petname=json['pet_name'];
      this.xhpauthority=json['xhp_authority'];
      this.paymentchoice=json['payment_choice'];

    } catch (e) {
      print('Exception in UserModel $e');
    }
  }

  Map<String, dynamic> toJson() => {
    'membership_no': membershipno,
    'title': title,
    'first_name': firstname,
    'last_name': lastname,
    'middle_name': middlename,
    'username': username,
    'email': email,
    'signup_status':signupstatus,
    'password': password,
    'mobile_no': mobileno,
    'referral_code':referralcode,
    'profile_pic': profilepic,
    'unique_code': uniquecode,
    'otp': otp,
    'pet_name': petname,
    'xhp_authority':xhpauthority,
    'payment_choice':paymentchoice,

  };

}