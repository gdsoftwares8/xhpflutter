class Gift {
  int _idGift;
  int _fkIdMember;
  int _fkIdReconcileSetup;
  int _idReconciliationRefCtox;
  int _idReconciliationRefXtoc;
  String _receiverName;
  String _receiverEmail;
  int _amountExceedFlag;
  String _couponCode;
  String _giftAmount;
  String _giftAmountAvailable;
  String _totalAmount;
  String _xhpFee;
  String _xhpFeeTotal;
  String _giftExpiryDate;
  int _coaMember;
  int _coaXhp;
  String _status;
  String _paymentTypeMember;
  String _paymentTypeXhp;
  String _batchStatusCtox;
  String _batchStatusXtoc;

  int get idGift => _idGift;
  int get fkIdMember => _fkIdMember;
  int get fkIdReconcileSetup => _fkIdReconcileSetup;
  int get idReconciliationRefCtox => _idReconciliationRefCtox;
  int get idReconciliationRefXtoc => _idReconciliationRefXtoc;
  String get receiverName => _receiverName;
  String get receiverEmail => _receiverEmail;
  int get amountExceedFlag => _amountExceedFlag;
  String get couponCode => _couponCode;
  String get giftAmount => _giftAmount;
  String get giftAmountAvailable => _giftAmountAvailable;
  String get totalAmount => _totalAmount;
  String get xhpFee => _xhpFee;
  String get xhpFeeTotal => _xhpFeeTotal;
  String get giftExpiryDate => _giftExpiryDate;
  int get coaMember => _coaMember;
  int get coaXhp => _coaXhp;
  String get status => _status;
  String get paymentTypeMember => _paymentTypeMember;
  String get paymentTypeXhp => _paymentTypeXhp;
  String get batchStatusCtox => _batchStatusCtox;
  String get batchStatusXtoc => _batchStatusXtoc;

  Gift({
      int idGift, 
      int fkIdMember, 
      int fkIdReconcileSetup, 
      int idReconciliationRefCtox, 
      int idReconciliationRefXtoc, 
      String receiverName, 
      String receiverEmail, 
      int amountExceedFlag, 
      String couponCode, 
      String giftAmount, 
      String giftAmountAvailable, 
      String totalAmount, 
      String xhpFee, 
      String xhpFeeTotal, 
      String giftExpiryDate, 
      int coaMember, 
      int coaXhp, 
      String status, 
      String paymentTypeMember, 
      String paymentTypeXhp, 
      String batchStatusCtox, 
      String batchStatusXtoc}){
    _idGift = idGift;
    _fkIdMember = fkIdMember;
    _fkIdReconcileSetup = fkIdReconcileSetup;
    _idReconciliationRefCtox = idReconciliationRefCtox;
    _idReconciliationRefXtoc = idReconciliationRefXtoc;
    _receiverName = receiverName;
    _receiverEmail = receiverEmail;
    _amountExceedFlag = amountExceedFlag;
    _couponCode = couponCode;
    _giftAmount = giftAmount;
    _giftAmountAvailable = giftAmountAvailable;
    _totalAmount = totalAmount;
    _xhpFee = xhpFee;
    _xhpFeeTotal = xhpFeeTotal;
    _giftExpiryDate = giftExpiryDate;
    _coaMember = coaMember;
    _coaXhp = coaXhp;
    _status = status;
    _paymentTypeMember = paymentTypeMember;
    _paymentTypeXhp = paymentTypeXhp;
    _batchStatusCtox = batchStatusCtox;
    _batchStatusXtoc = batchStatusXtoc;
}

  Gift.fromJson(dynamic json) {
    _idGift = json["id_gift"];
    _fkIdMember = json["fk_id_member"];
    _fkIdReconcileSetup = json["fk_id_reconcile_setup"];
    _idReconciliationRefCtox = json["id_reconciliation_ref_ctox"];
    _idReconciliationRefXtoc = json["id_reconciliation_ref_xtoc"];
    _receiverName = json["receiver_name"];
    _receiverEmail = json["receiver_email"];
    _amountExceedFlag = json["amount_exceed_flag"];
    _couponCode = json["coupon_code"];
    _giftAmount = json["gift_amount"];
    _giftAmountAvailable = json["gift_amount_available"];
    _totalAmount = json["total_amount"];
    _xhpFee = json["xhp_fee"];
    _xhpFeeTotal = json["xhp_fee_total"];
    _giftExpiryDate = json["gift_expiry_date"];
    _coaMember = json["coa_member"];
    _coaXhp = json["coa_xhp"];
    _status = json["status"];
    _paymentTypeMember = json["payment_type_member"];
    _paymentTypeXhp = json["payment_type_xhp"];
    _batchStatusCtox = json["batch_status_ctox"];
    _batchStatusXtoc = json["batch_status_xtoc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id_gift"] = _idGift;
    map["fk_id_member"] = _fkIdMember;
    map["fk_id_reconcile_setup"] = _fkIdReconcileSetup;
    map["id_reconciliation_ref_ctox"] = _idReconciliationRefCtox;
    map["id_reconciliation_ref_xtoc"] = _idReconciliationRefXtoc;
    map["receiver_name"] = _receiverName;
    map["receiver_email"] = _receiverEmail;
    map["amount_exceed_flag"] = _amountExceedFlag;
    map["coupon_code"] = _couponCode;
    map["gift_amount"] = _giftAmount;
    map["gift_amount_available"] = _giftAmountAvailable;
    map["total_amount"] = _totalAmount;
    map["xhp_fee"] = _xhpFee;
    map["xhp_fee_total"] = _xhpFeeTotal;
    map["gift_expiry_date"] = _giftExpiryDate;
    map["coa_member"] = _coaMember;
    map["coa_xhp"] = _coaXhp;
    map["status"] = _status;
    map["payment_type_member"] = _paymentTypeMember;
    map["payment_type_xhp"] = _paymentTypeXhp;
    map["batch_status_ctox"] = _batchStatusCtox;
    map["batch_status_xtoc"] = _batchStatusXtoc;
    return map;
  }

}