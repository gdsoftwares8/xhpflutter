class Withdrawal {
  int _idWithdrawal;
  int _fkIdPaymentTransaction;
  String _WithdrawalNumber;
  String _pdfName;
  String _subTotal;
  String _discount;
  String _grandTotal;
  String _status;
  String _type;

  int get idWithdrawal => _idWithdrawal;
  int get fkIdPaymentTransaction => _fkIdPaymentTransaction;
  String get WithdrawalNumber => _WithdrawalNumber;
  String get pdfName => _pdfName;
  String get subTotal => _subTotal;
  String get discount => _discount;
  String get grandTotal => _grandTotal;
  String get status => _status;
  String get type => _type;

  Withdrawal({
      int idWithdrawal, 
      int fkIdPaymentTransaction, 
      String WithdrawalNumber, 
      String pdfName, 
      String subTotal, 
      String discount, 
      String grandTotal, 
      String status, 
      String type}){
    _idWithdrawal = idWithdrawal;
    _fkIdPaymentTransaction = fkIdPaymentTransaction;
    _WithdrawalNumber = WithdrawalNumber;
    _pdfName = pdfName;
    _subTotal = subTotal;
    _discount = discount;
    _grandTotal = grandTotal;
    _status = status;
    _type = type;
}

  Withdrawal.fromJson(dynamic json) {
    _idWithdrawal = json["id_Withdrawal"];
    _fkIdPaymentTransaction = json["fk_id_payment_transaction"];
    _WithdrawalNumber = json["Withdrawal_number"];
    _pdfName = json["pdf_name"];
    _subTotal = json["sub_total"];
    _discount = json["discount"];
    _grandTotal = json["grand_total"];
    _status = json["status"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id_Withdrawal"] = _idWithdrawal;
    map["fk_id_payment_transaction"] = _fkIdPaymentTransaction;
    map["Withdrawal_number"] = _WithdrawalNumber;
    map["pdf_name"] = _pdfName;
    map["sub_total"] = _subTotal;
    map["discount"] = _discount;
    map["grand_total"] = _grandTotal;
    map["status"] = _status;
    map["type"] = _type;
    return map;
  }

}