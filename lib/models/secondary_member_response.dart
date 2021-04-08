import 'secondary_member.dart';

class SecondaryMemberResponse {
  String message;
  List<SecondaryMemberModel> result;
  int status;

  SecondaryMemberResponse({this.message, this.result, this.status});

  SecondaryMemberResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = new List<SecondaryMemberModel>();
      json['result'].forEach((v) {
        result.add(new SecondaryMemberModel.fromJson(v));
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

