
import 'package:xhp/models/gift.dart';

class GiftResponce {
  String _message;
  Result _result;
  int _status;

  String get message => _message;
  Result get result => _result;
  int get status => _status;

  GiftResponce({
      String message, 
      Result result, 
      int status}){
    _message = message;
    _result = result;
    _status = status;
}

  GiftResponce.fromJson(dynamic json) {
    _message = json["message"];
    _result = json["result"] != null ? Result.fromJson(json["result"]) : null;
    _status = json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_result != null) {
      map["result"] = _result.toJson();
    }
    map["status"] = _status;
    return map;
  }

}

/// send : [{"id_gift":1,"fk_id_member":1,"fk_id_reconcile_setup":12,"id_reconciliation_ref_ctox":0,"id_reconciliation_ref_xtoc":0,"receiver_name":"Receiver Name","receiver_email":"receiveremail@mailinator.com","amount_exceed_flag":0,"coupon_code":"TWTCRI3HYP","gift_amount":"100.00","gift_amount_available":"100.00","total_amount":"100.00","xhp_fee":"0.00","xhp_fee_total":"0.00","gift_expiry_date":"2022-03-21","coa_member":6010,"coa_xhp":2800,"status":"ACTIVE","payment_type_member":"DEBIT","payment_type_xhp":"CREDIT","batch_status_ctox":"READY_FOR_BATCH_PROCESS","batch_status_xtoc":"NOT_APPLICABLE"}]
/// received : []

class Result {
  List<Gift> _send;
  List<Gift> _received;

  List<Gift> get send => _send;
  List<Gift> get received => _received;

  Result({
      List<Gift> send,
      List<Gift> received}){
    _send = send;
    _received = received;
}

  Result.fromJson(dynamic json) {
    if (json["send"] != null) {
      _send = [];
      json["send"].forEach((v) {
        _send.add(Gift.fromJson(v));
      });
    }
    if (json["received"] != null) {
      _received = [];
      json["received"].forEach((v) {
        _received.add(Gift.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_send != null) {
      map["send"] = _send.map((v) => v.toJson()).toList();
    }
    if (_received != null) {
      map["received"] = _received.map((v) => v.toJson()).toList();
    }
    return map;
  }

}