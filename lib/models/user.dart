// class User{
// String membershipno;
// String title;
// String firstname;
// String lastname;
// String middlename;
// String username ;
// String email;
// bool signupstatus;
// String password;
// String mobileno;
// String referralcode;
// String uniquecode;
// String profilepic;
// String dob;
// String otp;
// String petname;
// String xhpauthority;
// String paymentchoice;



//   User.fromJson(Map<String, dynamic> json) {
//     try {
//       this.membershipno = json['membership_no'];
//       this.title = json['title'];
//       this.firstname = json['first_name'];
//       this.lastname = json['last_name'];
//       this.middlename = json['middle_name'];
//       this.username=json['username'];
//       this.email = json['email'];
//       this.signupstatus=json['signup_status'];
//       this.password=json['password'];
//       this.mobileno=json['mobile_no'];
//       this.referralcode=json['referral_code'];
//       this.profilepic=json['profile_pic'];
//       this.uniquecode=json['unique_code'];
//       this.otp=json['otp'];
//       this.petname=json['pet_name'];
//       this.xhpauthority=json['xhp_authority'];
//       this.paymentchoice=json['payment_choice'];

//     } catch (e) {
//       print('Exception in UserModel $e');
//     }
//   }

//   Map<String, dynamic> toJson() => {
//     'membership_no': membershipno,
//     'title': title,
//     'first_name': firstname,
//     'last_name': lastname,
//     'middle_name': middlename,
//     'username': username,
//     'email': email,
//     'signup_status':signupstatus,
//     'password': password,
//     'mobile_no': mobileno,
//     'referral_code':referralcode,
//     'profile_pic': profilepic,
//     'unique_code': uniquecode,
//     'otp': otp,
//     'pet_name': petname,
//     'xhp_authority':xhpauthority,
//     'payment_choice':paymentchoice,

//   };

// }
class User {
  int idMember;
  String membershipNo;
  String uniqueCode;
  String firstName;
  String lastName;
  String middleName;
  Null petName;
  String mobileNo;
  int phoneCode;
  String title;
  String memberType;
  String email;
  String address1;
  Null address2;
  String city;
  String state;

  User(
      {this.idMember,
      this.membershipNo,
      this.uniqueCode,
      this.firstName,
      this.lastName,
      this.middleName,
      this.petName,
      this.mobileNo,
      this.phoneCode,
      this.title,
      this.memberType,
      this.email,
      this.address1,
      this.address2,
      this.city,
      this.state});

  User.fromJson(Map<String, dynamic> json) {
    idMember = json['id_member'];
    membershipNo = json['membership_no'];
    uniqueCode = json['unique_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    petName = json['pet_name'];
    mobileNo = json['mobile_no'];
    phoneCode = json['phone_code'];
    title = json['title'];
    memberType = json['member_type'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_member'] = this.idMember;
    data['membership_no'] = this.membershipNo;
    data['unique_code'] = this.uniqueCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['pet_name'] = this.petName;
    data['mobile_no'] = this.mobileNo;
    data['phone_code'] = this.phoneCode;
    data['title'] = this.title;
    data['member_type'] = this.memberType;
    data['email'] = this.email;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    return data;
  }
}
