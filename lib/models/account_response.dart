import 'account-model.dart';

class AccountResponse {
  String message;
  AccountModel result;
  int status;

  AccountResponse({this.message, this.result, this.status});

  AccountResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result =
        json['result'] != null ? new AccountModel.fromJson(json['result']) : null;
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

