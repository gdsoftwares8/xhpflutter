

class InterestModel {
  String s01Info;
  String s01Total;
  String s01ExpectedInterest;
  String s01ActualInterest;
  Null n01Withhold;
  String s02Info;
  String s02Total;
  String s02ExpectedInterest;
  String s02ActualInterest;
  Null n02Withhold;
  Null n03Info;
  String s03Total;
  String s03ExpectedInterest;
  String s03ActualInterest;
  Null n03Withhold;
  Null n04Info;
  String s04Total;
  String s04ExpectedInterest;
  String s04ActualInterest;
  Null n04Withhold;
  Null n05Info;
  String s05Total;
  String s05ExpectedInterest;
  String s05ActualInterest;
  Null n05Withhold;
  Null n06Info;
  String s06Total;
  String s06ExpectedInterest;
  String s06ActualInterest;
  Null n06Withhold;
  Null n07Info;
  String s07Total;
  String s07ExpectedInterest;
  String s07ActualInterest;
  Null n07Withhold;
  Null n08Info;
  String s08Total;
  String s08ExpectedInterest;
  String s08ActualInterest;
  Null n08Withhold;
  Null n09Info;
  String s09Total;
  String s09ExpectedInterest;
  String s09ActualInterest;
  Null n09Withhold;
  Null n10Info;
  String s10Total;
  String s10ExpectedInterest;
  String s10ActualInterest;
  Null n10Withhold;
  Null n11Info;
  String s11Total;
  String s11ExpectedInterest;
  String s11ActualInterest;
  Null n11Withhold;
  Null n12Info;
  String s12Total;
  String s12ExpectedInterest;
  String s12ActualInterest;
  Null n12Withhold;
  String firstName;
  String lastName;
  int idMember;
  String membershipNo;
  String title;
  String citizenTfn;

  InterestModel(
      {this.s01Info,
      this.s01Total,
      this.s01ExpectedInterest,
      this.s01ActualInterest,
      this.n01Withhold,
      this.s02Info,
      this.s02Total,
      this.s02ExpectedInterest,
      this.s02ActualInterest,
      this.n02Withhold,
      this.n03Info,
      this.s03Total,
      this.s03ExpectedInterest,
      this.s03ActualInterest,
      this.n03Withhold,
      this.n04Info,
      this.s04Total,
      this.s04ExpectedInterest,
      this.s04ActualInterest,
      this.n04Withhold,
      this.n05Info,
      this.s05Total,
      this.s05ExpectedInterest,
      this.s05ActualInterest,
      this.n05Withhold,
      this.n06Info,
      this.s06Total,
      this.s06ExpectedInterest,
      this.s06ActualInterest,
      this.n06Withhold,
      this.n07Info,
      this.s07Total,
      this.s07ExpectedInterest,
      this.s07ActualInterest,
      this.n07Withhold,
      this.n08Info,
      this.s08Total,
      this.s08ExpectedInterest,
      this.s08ActualInterest,
      this.n08Withhold,
      this.n09Info,
      this.s09Total,
      this.s09ExpectedInterest,
      this.s09ActualInterest,
      this.n09Withhold,
      this.n10Info,
      this.s10Total,
      this.s10ExpectedInterest,
      this.s10ActualInterest,
      this.n10Withhold,
      this.n11Info,
      this.s11Total,
      this.s11ExpectedInterest,
      this.s11ActualInterest,
      this.n11Withhold,
      this.n12Info,
      this.s12Total,
      this.s12ExpectedInterest,
      this.s12ActualInterest,
      this.n12Withhold,
      this.firstName,
      this.lastName,
      this.idMember,
      this.membershipNo,
      this.title,
      this.citizenTfn});

  InterestModel.fromJson(Map<String, dynamic> json) {
    s01Info = json['01_info'];
    s01Total = json['01_total'];
    s01ExpectedInterest = json['01_expected_interest'];
    s01ActualInterest = json['01_actual_interest'];
    n01Withhold = json['01_withhold'];
    s02Info = json['02_info'];
    s02Total = json['02_total'];
    s02ExpectedInterest = json['02_expected_interest'];
    s02ActualInterest = json['02_actual_interest'];
    n02Withhold = json['02_withhold'];
    n03Info = json['03_info'];
    s03Total = json['03_total'];
    s03ExpectedInterest = json['03_expected_interest'];
    s03ActualInterest = json['03_actual_interest'];
    n03Withhold = json['03_withhold'];
    n04Info = json['04_info'];
    s04Total = json['04_total'];
    s04ExpectedInterest = json['04_expected_interest'];
    s04ActualInterest = json['04_actual_interest'];
    n04Withhold = json['04_withhold'];
    n05Info = json['05_info'];
    s05Total = json['05_total'];
    s05ExpectedInterest = json['05_expected_interest'];
    s05ActualInterest = json['05_actual_interest'];
    n05Withhold = json['05_withhold'];
    n06Info = json['06_info'];
    s06Total = json['06_total'];
    s06ExpectedInterest = json['06_expected_interest'];
    s06ActualInterest = json['06_actual_interest'];
    n06Withhold = json['06_withhold'];
    n07Info = json['07_info'];
    s07Total = json['07_total'];
    s07ExpectedInterest = json['07_expected_interest'];
    s07ActualInterest = json['07_actual_interest'];
    n07Withhold = json['07_withhold'];
    n08Info = json['08_info'];
    s08Total = json['08_total'];
    s08ExpectedInterest = json['08_expected_interest'];
    s08ActualInterest = json['08_actual_interest'];
    n08Withhold = json['08_withhold'];
    n09Info = json['09_info'];
    s09Total = json['09_total'];
    s09ExpectedInterest = json['09_expected_interest'];
    s09ActualInterest = json['09_actual_interest'];
    n09Withhold = json['09_withhold'];
    n10Info = json['10_info'];
    s10Total = json['10_total'];
    s10ExpectedInterest = json['10_expected_interest'];
    s10ActualInterest = json['10_actual_interest'];
    n10Withhold = json['10_withhold'];
    n11Info = json['11_info'];
    s11Total = json['11_total'];
    s11ExpectedInterest = json['11_expected_interest'];
    s11ActualInterest = json['11_actual_interest'];
    n11Withhold = json['11_withhold'];
    n12Info = json['12_info'];
    s12Total = json['12_total'];
    s12ExpectedInterest = json['12_expected_interest'];
    s12ActualInterest = json['12_actual_interest'];
    n12Withhold = json['12_withhold'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    idMember = json['id_member'];
    membershipNo = json['membership_no'];
    title = json['title'];
    citizenTfn = json['citizen_tfn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['01_info'] = this.s01Info;
    data['01_total'] = this.s01Total;
    data['01_expected_interest'] = this.s01ExpectedInterest;
    data['01_actual_interest'] = this.s01ActualInterest;
    data['01_withhold'] = this.n01Withhold;
    data['02_info'] = this.s02Info;
    data['02_total'] = this.s02Total;
    data['02_expected_interest'] = this.s02ExpectedInterest;
    data['02_actual_interest'] = this.s02ActualInterest;
    data['02_withhold'] = this.n02Withhold;
    data['03_info'] = this.n03Info;
    data['03_total'] = this.s03Total;
    data['03_expected_interest'] = this.s03ExpectedInterest;
    data['03_actual_interest'] = this.s03ActualInterest;
    data['03_withhold'] = this.n03Withhold;
    data['04_info'] = this.n04Info;
    data['04_total'] = this.s04Total;
    data['04_expected_interest'] = this.s04ExpectedInterest;
    data['04_actual_interest'] = this.s04ActualInterest;
    data['04_withhold'] = this.n04Withhold;
    data['05_info'] = this.n05Info;
    data['05_total'] = this.s05Total;
    data['05_expected_interest'] = this.s05ExpectedInterest;
    data['05_actual_interest'] = this.s05ActualInterest;
    data['05_withhold'] = this.n05Withhold;
    data['06_info'] = this.n06Info;
    data['06_total'] = this.s06Total;
    data['06_expected_interest'] = this.s06ExpectedInterest;
    data['06_actual_interest'] = this.s06ActualInterest;
    data['06_withhold'] = this.n06Withhold;
    data['07_info'] = this.n07Info;
    data['07_total'] = this.s07Total;
    data['07_expected_interest'] = this.s07ExpectedInterest;
    data['07_actual_interest'] = this.s07ActualInterest;
    data['07_withhold'] = this.n07Withhold;
    data['08_info'] = this.n08Info;
    data['08_total'] = this.s08Total;
    data['08_expected_interest'] = this.s08ExpectedInterest;
    data['08_actual_interest'] = this.s08ActualInterest;
    data['08_withhold'] = this.n08Withhold;
    data['09_info'] = this.n09Info;
    data['09_total'] = this.s09Total;
    data['09_expected_interest'] = this.s09ExpectedInterest;
    data['09_actual_interest'] = this.s09ActualInterest;
    data['09_withhold'] = this.n09Withhold;
    data['10_info'] = this.n10Info;
    data['10_total'] = this.s10Total;
    data['10_expected_interest'] = this.s10ExpectedInterest;
    data['10_actual_interest'] = this.s10ActualInterest;
    data['10_withhold'] = this.n10Withhold;
    data['11_info'] = this.n11Info;
    data['11_total'] = this.s11Total;
    data['11_expected_interest'] = this.s11ExpectedInterest;
    data['11_actual_interest'] = this.s11ActualInterest;
    data['11_withhold'] = this.n11Withhold;
    data['12_info'] = this.n12Info;
    data['12_total'] = this.s12Total;
    data['12_expected_interest'] = this.s12ExpectedInterest;
    data['12_actual_interest'] = this.s12ActualInterest;
    data['12_withhold'] = this.n12Withhold;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['id_member'] = this.idMember;
    data['membership_no'] = this.membershipNo;
    data['title'] = this.title;
    data['citizen_tfn'] = this.citizenTfn;
    return data;
  }
}

class SearchMonth {
  String s10;
  String s11;
  String s12;
  String s07;
  String s08;
  String s09;
  String s01;
  String s02;
  String s03;
  String s04;
  String s05;
  String s06;

  SearchMonth(
      {this.s10,
      this.s11,
      this.s12,
      this.s07,
      this.s08,
      this.s09,
      this.s01,
      this.s02,
      this.s03,
      this.s04,
      this.s05,
      this.s06});

  SearchMonth.fromJson(Map<String, dynamic> json) {
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s07 = json['07'];
    s08 = json['08'];
    s09 = json['09'];
    s01 = json['01'];
    s02 = json['02'];
    s03 = json['03'];
    s04 = json['04'];
    s05 = json['05'];
    s06 = json['06'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['07'] = this.s07;
    data['08'] = this.s08;
    data['09'] = this.s09;
    data['01'] = this.s01;
    data['02'] = this.s02;
    data['03'] = this.s03;
    data['04'] = this.s04;
    data['05'] = this.s05;
    data['06'] = this.s06;
    return data;
  }
}
