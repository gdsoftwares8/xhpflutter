class Invoice {
  int _idInvoice;
  int _fkIdPaymentTransaction;
  String _invoiceNumber;
  String _pdfName;
  String _subTotal;
  String _discount;
  String _grandTotal;
  String _status;
  String _type;

  int get idInvoice => _idInvoice;
  int get fkIdPaymentTransaction => _fkIdPaymentTransaction;
  String get invoiceNumber => _invoiceNumber;
  String get pdfName => _pdfName;
  String get subTotal => _subTotal;
  String get discount => _discount;
  String get grandTotal => _grandTotal;
  String get status => _status;
  String get type => _type;

  Invoice({
      int idInvoice, 
      int fkIdPaymentTransaction, 
      String invoiceNumber, 
      String pdfName, 
      String subTotal, 
      String discount, 
      String grandTotal, 
      String status, 
      String type}){
    _idInvoice = idInvoice;
    _fkIdPaymentTransaction = fkIdPaymentTransaction;
    _invoiceNumber = invoiceNumber;
    _pdfName = pdfName;
    _subTotal = subTotal;
    _discount = discount;
    _grandTotal = grandTotal;
    _status = status;
    _type = type;
}

  Invoice.fromJson(dynamic json) {
    _idInvoice = json["id_invoice"];
    _fkIdPaymentTransaction = json["fk_id_payment_transaction"];
    _invoiceNumber = json["invoice_number"];
    _pdfName = json["pdf_name"];
    _subTotal = json["sub_total"];
    _discount = json["discount"];
    _grandTotal = json["grand_total"];
    _status = json["status"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id_invoice"] = _idInvoice;
    map["fk_id_payment_transaction"] = _fkIdPaymentTransaction;
    map["invoice_number"] = _invoiceNumber;
    map["pdf_name"] = _pdfName;
    map["sub_total"] = _subTotal;
    map["discount"] = _discount;
    map["grand_total"] = _grandTotal;
    map["status"] = _status;
    map["type"] = _type;
    return map;
  }

}