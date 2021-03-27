import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckInvoiceRepository {
  ApiProvider _provider = ApiProvider();

  Future<InvoiceResponce> fetchInvoices({Map<String, dynamic> queryParams}) async {
    final response = await _provider.get(GlobalVars.INVOICES_URL,queryParams: queryParams);
    return InvoiceResponce.fromJson(response);
  }
}