class ContributionYear {
  int idFinancialYear;
  String startYear;
  String endYear;
  int currentYear;
  String year;
  String yearCol;
  String status;

  ContributionYear(
      {this.idFinancialYear,
      this.startYear,
      this.endYear,
      this.currentYear,
      this.year,
      this.yearCol,
      this.status});

  ContributionYear.fromJson(Map<String, dynamic> json) {
    idFinancialYear = json['id_financial_year'];
    startYear = json['start_year'];
    endYear = json['end_year'];
    currentYear = json['current_year'];
    year = json['year'];
    yearCol = json['year_col'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_financial_year'] = this.idFinancialYear;
    data['start_year'] = this.startYear;
    data['end_year'] = this.endYear;
    data['current_year'] = this.currentYear;
    data['year'] = this.year;
    data['year_col'] = this.yearCol;
    data['status'] = this.status;
    return data;
  }
}

class ContributionService {
  int idServiceCategory;
  String name;
  String status;

  ContributionService({this.idServiceCategory, this.name, this.status});

  ContributionService.fromJson(Map<String, dynamic> json) {
    idServiceCategory = json['id_service_category'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_service_category'] = this.idServiceCategory;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}

class ContributionMember {
  int idMember;
  Null fkIdXhpReference;
  int fkIdMember;
  Null fkIdOccupation;
  String liveCountry;
  String membershipNo;
  String uniqueCode;
  String firstName;
  String lastName;
  Null middleName;
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
  String postcode;
  int age;
  Null profilePic;
  String dob;
  String agreementDate;
  String otp;
  String citizenTfn;
  String isHaveTfn;
  int isFsgVerified;
  int isPdsVerified;
  String isKycVerified;
  int isAcceptKycVerification;
  int isFreezeActivity;
  String isLivedCountry;
  String isCitizenCountry;
  int isNotCitizenFlag;
  String isAbroginal;
  String isPep;
  int isAcceptAuthority;
  int isAcceptFeeVerification;
  int isWaivingPeriod;
  String sourceOfIncome;
  int signup3State;
  String signupStatus;
  String status;
  int isQuickBookCustomer;
  int idQuickBookCustomer;
  String xhpAuthority;
  String latitude;
  String longitude;
  String availableBalance;
  String actualAmount;
  String reserveAmount;
  String minimumAccountBalance;
  String rolloverYear;
  String rolloverAmount;
  String membershipEndDate;
  Null referralCode;
  String activationDate;
  String suspensionStatus;
  Null paymentChoice;
  String createdAt;
  String updatedAt;

  ContributionMember(
      {this.idMember,
      this.fkIdXhpReference,
      this.fkIdMember,
      this.fkIdOccupation,
      this.liveCountry,
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
      this.state,
      this.postcode,
      this.age,
      this.profilePic,
      this.dob,
      this.agreementDate,
      this.otp,
      this.citizenTfn,
      this.isHaveTfn,
      this.isFsgVerified,
      this.isPdsVerified,
      this.isKycVerified,
      this.isAcceptKycVerification,
      this.isFreezeActivity,
      this.isLivedCountry,
      this.isCitizenCountry,
      this.isNotCitizenFlag,
      this.isAbroginal,
      this.isPep,
      this.isAcceptAuthority,
      this.isAcceptFeeVerification,
      this.isWaivingPeriod,
      this.sourceOfIncome,
      this.signup3State,
      this.signupStatus,
      this.status,
      this.isQuickBookCustomer,
      this.idQuickBookCustomer,
      this.xhpAuthority,
      this.latitude,
      this.longitude,
      this.availableBalance,
      this.actualAmount,
      this.reserveAmount,
      this.minimumAccountBalance,
      this.rolloverYear,
      this.rolloverAmount,
      this.membershipEndDate,
      this.referralCode,
      this.activationDate,
      this.suspensionStatus,
      this.paymentChoice,
      this.createdAt,
      this.updatedAt});

  ContributionMember.fromJson(Map<String, dynamic> json) {
    idMember = json['id_member'];
    fkIdXhpReference = json['fk_id_xhp_reference'];
    fkIdMember = json['fk_id_member'];
    fkIdOccupation = json['fk_id_occupation'];
    liveCountry = json['live_country'];
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
    postcode = json['postcode'];
    age = json['age'];
    profilePic = json['profile_pic'];
    dob = json['dob'];
    agreementDate = json['agreement_date'];
    otp = json['otp'];
    citizenTfn = json['citizen_tfn'];
    isHaveTfn = json['is_have_tfn'];
    isFsgVerified = json['is_fsg_verified'];
    isPdsVerified = json['is_pds_verified'];
    isKycVerified = json['is_kyc_verified'];
    isAcceptKycVerification = json['is_accept_kyc_verification'];
    isFreezeActivity = json['is_freeze_activity'];
    isLivedCountry = json['is_lived_country'];
    isCitizenCountry = json['is_citizen_country'];
    isNotCitizenFlag = json['is_not_citizen_flag'];
    isAbroginal = json['is_abroginal'];
    isPep = json['is_pep'];
    isAcceptAuthority = json['is_accept_authority'];
    isAcceptFeeVerification = json['is_accept_fee_verification'];
    isWaivingPeriod = json['is_waiving_period'];
    sourceOfIncome = json['source_of_income'];
    signup3State = json['signup3_state'];
    signupStatus = json['signup_status'];
    status = json['status'];
    isQuickBookCustomer = json['is_quick_book_customer'];
    idQuickBookCustomer = json['id_quick_book_customer'];
    xhpAuthority = json['xhp_authority'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    availableBalance = json['available_balance'];
    actualAmount = json['actual_amount'];
    reserveAmount = json['reserve_amount'];
    minimumAccountBalance = json['minimum_account_balance'];
    rolloverYear = json['rollover_year'];
    rolloverAmount = json['rollover_amount'];
    membershipEndDate = json['membership_end_date'];
    referralCode = json['referral_code'];
    activationDate = json['activation_date'];
    suspensionStatus = json['suspension_status'];
    paymentChoice = json['payment_choice'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_member'] = this.idMember;
    data['fk_id_xhp_reference'] = this.fkIdXhpReference;
    data['fk_id_member'] = this.fkIdMember;
    data['fk_id_occupation'] = this.fkIdOccupation;
    data['live_country'] = this.liveCountry;
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
    data['postcode'] = this.postcode;
    data['age'] = this.age;
    data['profile_pic'] = this.profilePic;
    data['dob'] = this.dob;
    data['agreement_date'] = this.agreementDate;
    data['otp'] = this.otp;
    data['citizen_tfn'] = this.citizenTfn;
    data['is_have_tfn'] = this.isHaveTfn;
    data['is_fsg_verified'] = this.isFsgVerified;
    data['is_pds_verified'] = this.isPdsVerified;
    data['is_kyc_verified'] = this.isKycVerified;
    data['is_accept_kyc_verification'] = this.isAcceptKycVerification;
    data['is_freeze_activity'] = this.isFreezeActivity;
    data['is_lived_country'] = this.isLivedCountry;
    data['is_citizen_country'] = this.isCitizenCountry;
    data['is_not_citizen_flag'] = this.isNotCitizenFlag;
    data['is_abroginal'] = this.isAbroginal;
    data['is_pep'] = this.isPep;
    data['is_accept_authority'] = this.isAcceptAuthority;
    data['is_accept_fee_verification'] = this.isAcceptFeeVerification;
    data['is_waiving_period'] = this.isWaivingPeriod;
    data['source_of_income'] = this.sourceOfIncome;
    data['signup3_state'] = this.signup3State;
    data['signup_status'] = this.signupStatus;
    data['status'] = this.status;
    data['is_quick_book_customer'] = this.isQuickBookCustomer;
    data['id_quick_book_customer'] = this.idQuickBookCustomer;
    data['xhp_authority'] = this.xhpAuthority;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['available_balance'] = this.availableBalance;
    data['actual_amount'] = this.actualAmount;
    data['reserve_amount'] = this.reserveAmount;
    data['minimum_account_balance'] = this.minimumAccountBalance;
    data['rollover_year'] = this.rolloverYear;
    data['rollover_amount'] = this.rolloverAmount;
    data['membership_end_date'] = this.membershipEndDate;
    data['referral_code'] = this.referralCode;
    data['activation_date'] = this.activationDate;
    data['suspension_status'] = this.suspensionStatus;
    data['payment_choice'] = this.paymentChoice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
