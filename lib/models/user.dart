class User {
  int idMember;
  String membershipNo;
  String uniqueCode;
  String firstName;
  String lastName;
  String middleName;
  String petName;
  String mobileNo;
  int phoneCode;
  String title;
  String memberType;
  String email;
  String address1;
  String address2;
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

  @override
  String toString() {
    return 'User{idMember: $idMember, membershipNo: $membershipNo, uniqueCode: $uniqueCode, firstName: $firstName, lastName: $lastName, middleName: $middleName, petName: $petName, mobileNo: $mobileNo, phoneCode: $phoneCode, title: $title, memberType: $memberType, email: $email, address1: $address1, address2: $address2, city: $city, state: $state}';
  }
}
