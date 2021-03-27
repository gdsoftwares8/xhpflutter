class AppointmentModel {
  int _idAppointment;
  int _fkIdMember;
  int _fkIdPrimaryMember;
  int _fkIdPartner;
  int _fkIdBookByMember;
  int _fkIdServiceCategory;
  int _fkIdPartnerAddress;
  dynamic _fkIdPractitioner;
  String _preferredDate;
  dynamic _alternateDate;
  int _sitting;
  String _netPayable;
  dynamic _grandTotal;
  String _linAmount;
  int _isDiscount;
  dynamic _discountReason;
  String _discount;
  dynamic _discountAmount;
  String _gapAmount;
  dynamic _otp;
  String _remarks;
  String _status;
  dynamic _ifcNo;
  String _preferredTime;
  String _discountType;
  dynamic _ifcStatus;
  dynamic _nxtAppTime;
  dynamic _nxtAppConfirmation;
  dynamic _nxtAppStatus;
  int _isChargePaid;
  int _isPhiRebate;
  dynamic _company;
  dynamic _companyMembershipNo;

  int get idAppointment => _idAppointment;
  int get fkIdMember => _fkIdMember;
  int get fkIdPrimaryMember => _fkIdPrimaryMember;
  int get fkIdPartner => _fkIdPartner;
  int get fkIdBookByMember => _fkIdBookByMember;
  int get fkIdServiceCategory => _fkIdServiceCategory;
  int get fkIdPartnerAddress => _fkIdPartnerAddress;
  dynamic get fkIdPractitioner => _fkIdPractitioner;
  String get preferredDate => _preferredDate;
  dynamic get alternateDate => _alternateDate;
  int get sitting => _sitting;
  String get netPayable => _netPayable;
  dynamic get grandTotal => _grandTotal;
  String get linAmount => _linAmount;
  int get isDiscount => _isDiscount;
  dynamic get discountReason => _discountReason;
  String get discount => _discount;
  dynamic get discountAmount => _discountAmount;
  String get gapAmount => _gapAmount;
  dynamic get otp => _otp;
  String get remarks => _remarks;
  String get status => _status;
  dynamic get ifcNo => _ifcNo;
  String get preferredTime => _preferredTime;
  String get discountType => _discountType;
  dynamic get ifcStatus => _ifcStatus;
  dynamic get nxtAppTime => _nxtAppTime;
  dynamic get nxtAppConfirmation => _nxtAppConfirmation;
  dynamic get nxtAppStatus => _nxtAppStatus;
  int get isChargePaid => _isChargePaid;
  int get isPhiRebate => _isPhiRebate;
  dynamic get company => _company;
  dynamic get companyMembershipNo => _companyMembershipNo;

  AppointmentModel({
      int idAppointment, 
      int fkIdMember, 
      int fkIdPrimaryMember, 
      int fkIdPartner, 
      int fkIdBookByMember, 
      int fkIdServiceCategory, 
      int fkIdPartnerAddress, 
      dynamic fkIdPractitioner, 
      String preferredDate, 
      dynamic alternateDate, 
      int sitting, 
      String netPayable, 
      dynamic grandTotal, 
      String linAmount, 
      int isDiscount, 
      dynamic discountReason, 
      String discount, 
      dynamic discountAmount, 
      String gapAmount, 
      dynamic otp, 
      String remarks, 
      String status, 
      dynamic ifcNo, 
      String preferredTime, 
      String discountType, 
      dynamic ifcStatus, 
      dynamic nxtAppTime, 
      dynamic nxtAppConfirmation, 
      dynamic nxtAppStatus, 
      int isChargePaid, 
      int isPhiRebate, 
      dynamic company, 
      dynamic companyMembershipNo}){
    _idAppointment = idAppointment;
    _fkIdMember = fkIdMember;
    _fkIdPrimaryMember = fkIdPrimaryMember;
    _fkIdPartner = fkIdPartner;
    _fkIdBookByMember = fkIdBookByMember;
    _fkIdServiceCategory = fkIdServiceCategory;
    _fkIdPartnerAddress = fkIdPartnerAddress;
    _fkIdPractitioner = fkIdPractitioner;
    _preferredDate = preferredDate;
    _alternateDate = alternateDate;
    _sitting = sitting;
    _netPayable = netPayable;
    _grandTotal = grandTotal;
    _linAmount = linAmount;
    _isDiscount = isDiscount;
    _discountReason = discountReason;
    _discount = discount;
    _discountAmount = discountAmount;
    _gapAmount = gapAmount;
    _otp = otp;
    _remarks = remarks;
    _status = status;
    _ifcNo = ifcNo;
    _preferredTime = preferredTime;
    _discountType = discountType;
    _ifcStatus = ifcStatus;
    _nxtAppTime = nxtAppTime;
    _nxtAppConfirmation = nxtAppConfirmation;
    _nxtAppStatus = nxtAppStatus;
    _isChargePaid = isChargePaid;
    _isPhiRebate = isPhiRebate;
    _company = company;
    _companyMembershipNo = companyMembershipNo;
}

  AppointmentModel.fromJson(dynamic json) {
    _idAppointment = json["id_appointment"];
    _fkIdMember = json["fk_id_member"];
    _fkIdPrimaryMember = json["fk_id_primary_member"];
    _fkIdPartner = json["fk_id_partner"];
    _fkIdBookByMember = json["fk_id_book_by_member"];
    _fkIdServiceCategory = json["fk_id_service_category"];
    _fkIdPartnerAddress = json["fk_id_partner_address"];
    _fkIdPractitioner = json["fk_id_practitioner"];
    _preferredDate = json["preferred_date"];
    _alternateDate = json["alternate_date"];
    _sitting = json["sitting"];
    _netPayable = json["net_payable"];
    _grandTotal = json["grand_total"];
    _linAmount = json["lin_amount"];
    _isDiscount = json["is_discount"];
    _discountReason = json["discount_reason"];
    _discount = json["discount"];
    _discountAmount = json["discount_amount"];
    _gapAmount = json["gap_amount"];
    _otp = json["otp"];
    _remarks = json["remarks"];
    _status = json["status"];
    _ifcNo = json["ifc_no"];
    _preferredTime = json["preferred_time"];
    _discountType = json["discount_type"];
    _ifcStatus = json["ifc_status"];
    _nxtAppTime = json["nxt_app_time"];
    _nxtAppConfirmation = json["nxt_app_confirmation"];
    _nxtAppStatus = json["nxt_app_status"];
    _isChargePaid = json["is_charge_paid"];
    _isPhiRebate = json["is_phi_rebate"];
    _company = json["company"];
    _companyMembershipNo = json["company_membership_no"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id_appointment"] = _idAppointment;
    map["fk_id_member"] = _fkIdMember;
    map["fk_id_primary_member"] = _fkIdPrimaryMember;
    map["fk_id_partner"] = _fkIdPartner;
    map["fk_id_book_by_member"] = _fkIdBookByMember;
    map["fk_id_service_category"] = _fkIdServiceCategory;
    map["fk_id_partner_address"] = _fkIdPartnerAddress;
    map["fk_id_practitioner"] = _fkIdPractitioner;
    map["preferred_date"] = _preferredDate;
    map["alternate_date"] = _alternateDate;
    map["sitting"] = _sitting;
    map["net_payable"] = _netPayable;
    map["grand_total"] = _grandTotal;
    map["lin_amount"] = _linAmount;
    map["is_discount"] = _isDiscount;
    map["discount_reason"] = _discountReason;
    map["discount"] = _discount;
    map["discount_amount"] = _discountAmount;
    map["gap_amount"] = _gapAmount;
    map["otp"] = _otp;
    map["remarks"] = _remarks;
    map["status"] = _status;
    map["ifc_no"] = _ifcNo;
    map["preferred_time"] = _preferredTime;
    map["discount_type"] = _discountType;
    map["ifc_status"] = _ifcStatus;
    map["nxt_app_time"] = _nxtAppTime;
    map["nxt_app_confirmation"] = _nxtAppConfirmation;
    map["nxt_app_status"] = _nxtAppStatus;
    map["is_charge_paid"] = _isChargePaid;
    map["is_phi_rebate"] = _isPhiRebate;
    map["company"] = _company;
    map["company_membership_no"] = _companyMembershipNo;
    return map;
  }

}