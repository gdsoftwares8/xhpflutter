// import 'package:xhp/models/appointment_model.dart';
// import 'package:xhp/models/withdrawal-model.dart';

// /// message : "Data found!"
// /// result : [{"id_appointment":8,"fk_id_member":1,"fk_id_primary_member":1,"fk_id_partner":1,"fk_id_book_by_member":1,"fk_id_service_category":1,"fk_id_partner_address":1,"fk_id_practitioner":null,"preferred_date":"2020-03-19 04:30:00","alternate_date":null,"sitting":1,"net_payable":"0.00","grand_total":null,"lin_amount":"0.00","is_discount":0,"discount_reason":null,"discount":"0.00","discount_amount":null,"gap_amount":"0.00","otp":null,"remarks":"Not working on the 19th","status":"CANCEL","ifc_no":null,"preferred_time":"AM","discount_type":"PERCENT","ifc_status":null,"nxt_app_time":null,"nxt_app_confirmation":null,"nxt_app_status":null,"is_charge_paid":0,"is_phi_rebate":0,"company":null,"company_membership_no":null}]
// /// status : 1

// class WithdrawalResponce {
//   String _message;
//   List<Withdrawal> _result;
//   int _status;

//   String get message => _message;
//   List<Withdrawal> get result => _result;
//   int get status => _status;

//   WithdrawalResponce({
//       String message, 
//       List<Withdrawal> result,
//       int status}){
//     _message = message;
//     _result = result;
//     _status = status;
// }

//   WithdrawalResponce.fromJson(dynamic json) {
//     _message = json["message"];
//     if (json["result"] != null) {
//       _result = [];
//       json["result"].forEach((v) {
//         _result.add(Withdrawal.fromJson(v));
//       });
//     }
//     _status = json["status"];
//   }

//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["message"] = _message;
//     if (_result != null) {
//       map["result"] = _result.map((v) => v.toJson()).toList();
//     }
//     map["status"] = _status;
//     return map;
//   }

// }

import 'package:xhp/models/withdrawal-model.dart';

class WithdrawalResponce {
  String message;
  Result result;
  int status;

  WithdrawalResponce({this.message, this.result, this.status});

  WithdrawalResponce.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
 
  List<Withdrawal> withdraw;

  Result({this.withdraw});

  Result.fromJson(Map<String, dynamic> json) {
   
    if (json['withdraw'] != null) {
      withdraw = new List<Withdrawal>();
      json['withdraw'].forEach((v) {
        withdraw.add(new Withdrawal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    if (this.withdraw != null) {
      data['withdraw'] = this.withdraw.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
