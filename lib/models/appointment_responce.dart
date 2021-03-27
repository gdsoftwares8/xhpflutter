import 'package:xhp/models/appointment_model.dart';

/// message : "Data found!"
/// result : [{"id_appointment":8,"fk_id_member":1,"fk_id_primary_member":1,"fk_id_partner":1,"fk_id_book_by_member":1,"fk_id_service_category":1,"fk_id_partner_address":1,"fk_id_practitioner":null,"preferred_date":"2020-03-19 04:30:00","alternate_date":null,"sitting":1,"net_payable":"0.00","grand_total":null,"lin_amount":"0.00","is_discount":0,"discount_reason":null,"discount":"0.00","discount_amount":null,"gap_amount":"0.00","otp":null,"remarks":"Not working on the 19th","status":"CANCEL","ifc_no":null,"preferred_time":"AM","discount_type":"PERCENT","ifc_status":null,"nxt_app_time":null,"nxt_app_confirmation":null,"nxt_app_status":null,"is_charge_paid":0,"is_phi_rebate":0,"company":null,"company_membership_no":null}]
/// status : 1

class AppointmentResponce {
  String message;
  List<AppointmentModel> result;
  int status;

  AppointmentResponce({this.message, this.result, this.status});

  AppointmentResponce.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = new List<AppointmentModel>();
      json['result'].forEach((v) {
        result.add(new AppointmentModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }

}

