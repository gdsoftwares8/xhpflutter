import 'package:xhp/models/gift.dart';

class UpdateAppointmentResponse {
  String message;
  GiftModel result;
  int status;

  UpdateAppointmentResponse({this.message, this.result, this.status});

  UpdateAppointmentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result =
        json['result'] != null ? new GiftModel.fromJson(json['result']) : null;
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

