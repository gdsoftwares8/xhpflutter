import 'dart:async';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';

class ChuckAppointmentbloc {
  ChuckAppointmentRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<AppointmentResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<AppointmentResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckCategoryBloc() {
    _chuckListController = StreamController<Response<AppointmentResponce>>();
    _chuckRepository = ChuckAppointmentRepository();
    fetchAppointmets();
  }

  fetchAppointmets() async {
    chuckListSink.add(Response.loading('Getting Appointments.'));
    try {
      AppointmentResponce chuckDatas =
      await _chuckRepository.fetchAppointments();
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