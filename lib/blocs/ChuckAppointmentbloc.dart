import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/utils/GlobalFuncs.dart';

class ChuckAppointmentbloc {
  ChuckAppointmentRepository _chuckRepository;
  StreamController _chuckListController;
  bool _isStreaming;

  StreamSink<Response<AppointmentResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<AppointmentResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckAppointmentbloc(String memberId) {
    _chuckListController = StreamController<Response<AppointmentResponce>>();
    _chuckRepository = ChuckAppointmentRepository();
    _isStreaming = true;
    fetchAppointmets(memberId);
  }

  fetchAppointmets(String memberId) async {
   // GlobalFunc.logPrint("fetchAppointmets $memberId");
    chuckListSink.add(Response.loading('Getting Appointments.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);

      AppointmentResponce chuckDatas =
      await _chuckRepository.fetchAppointments(queryParams: map);
     // GlobalFunc.logPrint("chuckDatas $chuckDatas");
      if(chuckDatas.status == 1)
        if (_isStreaming) chuckListSink.add(Response.completed(chuckDatas));
      else
        if (_isStreaming) chuckListSink.add(Response.error(chuckDatas.message));
    } catch (e) {
      print(e);
      if (_isStreaming) chuckListSink.add(Response.error(e.toString()));

    }
  }

  dispose() {
    _isStreaming = false;
    _chuckListController?.close();
  }
}