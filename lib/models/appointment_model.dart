class AppointmentModel {
  int idAppointment;
  int fkIdMember;
  int fkIdPrimaryMember;
  int fkIdPartner;
  int fkIdBookByMember;
  int fkIdServiceCategory;
  int fkIdPartnerAddress;
  String fkIdPractitioner;
  String preferredDate;
  String alternateDate;
  int sitting;
  String netPayable;
  String grandTotal;
  String linAmount;
  int isDiscount;
  String discountReason;
  String discount;
  String discountAmount;
  String gapAmount;
  String otp;
  String remarks;
  String status;
  String ifcNo;
  String preferredTime;
  String discountType;
  String ifcStatus;
  String nxtAppTime;
  String nxtAppConfirmation;
  String nxtAppStatus;
  int isChargePaid;
  int isPhiRebate;
  String company;
  String companyMembershipNo;
  String firstName;
  String lastName;
  String memberType;
  String serviceCategoryName;
  AppointmentModel(
      {this.idAppointment,
        this.fkIdMember,
        this.fkIdPrimaryMember,
        this.fkIdPartner,
        this.fkIdBookByMember,
        this.fkIdServiceCategory,
        this.fkIdPartnerAddress,
        this.fkIdPractitioner,
        this.preferredDate,
        this.alternateDate,
        this.sitting,
        this.netPayable,
        this.grandTotal,
        this.linAmount,
        this.memberType,
        this.isDiscount,
        this.discountReason,
        this.discount,
        this.discountAmount,
        this.gapAmount,
        this.otp,
        this.remarks,
        this.status,
        this.ifcNo,
        this.preferredTime,
        this.discountType,
        this.ifcStatus,
        this.nxtAppTime,
        this.nxtAppConfirmation,
        this.nxtAppStatus,
        this.isChargePaid,
        this.isPhiRebate,
        this.company,
        this.serviceCategoryName,
        this.companyMembershipNo,this.firstName,this.lastName
        });

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    idAppointment = json['id_appointment'];
    fkIdMember = json['fk_id_member'];
    fkIdPrimaryMember = json['fk_id_primary_member'];
    fkIdPartner = json['fk_id_partner'];
    fkIdBookByMember = json['fk_id_book_by_member'];
    fkIdServiceCategory = json['fk_id_service_category'];
    fkIdPartnerAddress = json['fk_id_partner_address'];
    fkIdPractitioner = json['fk_id_practitioner'];
    preferredDate = json['preferred_date'];
    alternateDate = json['alternate_date'];
    sitting = json['sitting'];
    netPayable = json['net_payable'];
    grandTotal = json['grand_total'];
    linAmount = json['lin_amount'];
    isDiscount = json['is_discount'];
    discountReason = json['discount_reason'];
    discount = json['discount'];
    discountAmount = json['discount_amount'];
    gapAmount = json['gap_amount'];
    otp = json['otp'];
    remarks = json['remarks'];
    status = json['status'];
    ifcNo = json['ifc_no'];
    preferredTime = json['preferred_time'];
    discountType = json['discount_type'];
    ifcStatus = json['ifc_status'];
    nxtAppTime = json['nxt_app_time'];
    nxtAppConfirmation = json['nxt_app_confirmation'];
    nxtAppStatus = json['nxt_app_status'];
    isChargePaid = json['is_charge_paid'];
    isPhiRebate = json['is_phi_rebate'];
    company = json['company'];
    companyMembershipNo = json['company_membership_no'];
    firstName=json['first_name'];
    lastName=json['last_name'];
    memberType=json['member_type'];
    serviceCategoryName=json['service_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_appointment'] = this.idAppointment;
    data['fk_id_member'] = this.fkIdMember;
    data['fk_id_primary_member'] = this.fkIdPrimaryMember;
    data['fk_id_partner'] = this.fkIdPartner;
    data['fk_id_book_by_member'] = this.fkIdBookByMember;
    data['fk_id_service_category'] = this.fkIdServiceCategory;
    data['fk_id_partner_address'] = this.fkIdPartnerAddress;
    data['fk_id_practitioner'] = this.fkIdPractitioner;
    data['preferred_date'] = this.preferredDate;
    data['alternate_date'] = this.alternateDate;
    data['sitting'] = this.sitting;
    data['net_payable'] = this.netPayable;
    data['grand_total'] = this.grandTotal;
    data['lin_amount'] = this.linAmount;
    data['is_discount'] = this.isDiscount;
    data['discount_reason'] = this.discountReason;
    data['discount'] = this.discount;
    data['discount_amount'] = this.discountAmount;
    data['gap_amount'] = this.gapAmount;
    data['otp'] = this.otp;
    data['remarks'] = this.remarks;
    data['status'] = this.status;
    data['ifc_no'] = this.ifcNo;
    data['preferred_time'] = this.preferredTime;
    data['discount_type'] = this.discountType;
    data['ifc_status'] = this.ifcStatus;
    data['nxt_app_time'] = this.nxtAppTime;
    data['nxt_app_confirmation'] = this.nxtAppConfirmation;
    data['nxt_app_status'] = this.nxtAppStatus;
    data['is_charge_paid'] = this.isChargePaid;
    data['is_phi_rebate'] = this.isPhiRebate;
    data['company'] = this.company;
    data['company_membership_no'] = this.companyMembershipNo;
    data['first_name'] = this.firstName;
    data['last_name']=this.lastName;
    data['member_type']=this.memberType;
    data['service_category_name']=this.serviceCategoryName;
    return data;
  }

}