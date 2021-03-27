import 'dart:async';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckInvoiceRepository.dart';

class ChuckAppointmentbloc {
  ChuckInvoiceRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<InvoiceResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<InvoiceResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckCategoryBloc() {
    _chuckListController = StreamController<Response<InvoiceResponce>>();
    _chuckRepository = ChuckInvoiceRepository();
    fetchInvoices();
  }

  fetchInvoices() async {
    chuckListSink.add(Response.loading('Getting Invoices.'));
    try {
      InvoiceResponce chuckDatas =
      await _chuckRepository.fetchInvoices();
      if(chuckDatas.status == 1)
        chuckListSink.add(Response.completed(chuckDatas));
      else
        chuckListSink.add(Response.error(chuckDatas.message));
    } catch (e) {
      chuckListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}