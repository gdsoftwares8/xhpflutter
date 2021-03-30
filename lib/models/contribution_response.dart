// import 'package:xhp/models/Contribution_model.dart';

// /// message : "Data found!"
// /// result : [{"id_Contribution":8,"fk_id_member":1,"fk_id_primary_member":1,"fk_id_partner":1,"fk_id_book_by_member":1,"fk_id_service_category":1,"fk_id_partner_address":1,"fk_id_practitioner":null,"preferred_date":"2020-03-19 04:30:00","alternate_date":null,"sitting":1,"net_payable":"0.00","grand_total":null,"lin_amount":"0.00","is_discount":0,"discount_reason":null,"discount":"0.00","discount_amount":null,"gap_amount":"0.00","otp":null,"remarks":"Not working on the 19th","status":"CANCEL","ifc_no":null,"preferred_time":"AM","discount_type":"PERCENT","ifc_status":null,"nxt_app_time":null,"nxt_app_confirmation":null,"nxt_app_status":null,"is_charge_paid":0,"is_phi_rebate":0,"company":null,"company_membership_no":null}]
// /// status : 1

// class ContributionResponse {
//   String message;
//   List<ContributionModel> result;
//   int status;

//   ContributionResponse({this.message, this.result, this.status});

//   ContributionResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['result'] != null) {
//       result = new List<ContributionModel>();
//       json['result'].forEach((v) {
//         result.add(new ContributionModel.fromJson(v));
//       });
//     }
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.result != null) {
//       data['result'] = this.result.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     return data;
//   }

// }



import 'contribution-model.dart';

class ContributionResponse {
  String message;
  Result result;
  int status;

  ContributionResponse({this.message, this.result, this.status});

  ContributionResponse.fromJson(Map<String, dynamic> json) {
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
  List<ContributionYear> aYearRange;
  List<ContributionService> aServiceCategory;
  List<ContributionMember> aMemberGroup;

  Result({this.aYearRange, this.aServiceCategory, this.aMemberGroup});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['aYearRange'] != null) {
      aYearRange = new List<ContributionYear>();
      json['aYearRange'].forEach((v) {
        aYearRange.add(new ContributionYear.fromJson(v));
      });
    }
    if (json['aServiceCategory'] != null) {
      aServiceCategory = new List<ContributionService>();
      json['aServiceCategory'].forEach((v) {
        aServiceCategory.add(new ContributionService.fromJson(v));
      });
    }
    if (json['aMemberGroup'] != null) {
      aMemberGroup = new List<ContributionMember>();
      json['aMemberGroup'].forEach((v) {
        aMemberGroup.add(new ContributionMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aYearRange != null) {
      data['aYearRange'] = this.aYearRange.map((v) => v.toJson()).toList();
    }
    if (this.aServiceCategory != null) {
      data['aServiceCategory'] =
          this.aServiceCategory.map((v) => v.toJson()).toList();
    }
    if (this.aMemberGroup != null) {
      data['aMemberGroup'] = this.aMemberGroup.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

