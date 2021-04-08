import 'dart:async';
import 'dart:collection';


import 'package:xhp/models/gift_send_response.dart';
import 'package:xhp/models/update_app_response.dart';

import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckUpdateAppRepo.dart';

import 'package:xhp/utils/GlobalFuncs.dart';


class ChuckUpdateAppointmentbloc {
  ChuckUpdateAppointmentRepository _chuckRepository;
  StreamController _chuckListController = StreamController<Response<UpdateAppointmentResponse>>();

  Stream<Response<UpdateAppointmentResponse>> get chuckListStream =>
      _chuckListController.stream;

  ChuckUpdateAppointmentbloc() {
   // _chuckListController = StreamController.broadcast();
    _chuckRepository = ChuckUpdateAppointmentRepository();
  }

  fetchUpdateAppointment(String appointmentId, String memberId,String status,String remarks) async {
  //  _chuckListController.add("test");
   _chuckListController.add(Response<UpdateAppointmentResponse>.loading('Getting UpdateAppointment.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("id", () => appointmentId);
       map.putIfAbsent("status", () => status);
      map.putIfAbsent("remarks", () => remarks);
      map.putIfAbsent("member_id", () => memberId);
     // map.putIfAbsent("member_id", () => memberId);
      UpdateAppointmentResponse chuckDatas =
      await _chuckRepository.fetchUpdateAppointment(postParams: map);
    //  GlobalFunc.logPrint("UpdateAppointmen Responce $chuckDatas");
      if(chuckDatas.status == 1)
        _chuckListController.add(Response<UpdateAppointmentResponse>.completed(chuckDatas));
      else
        _chuckListController.add(Response<UpdateAppointmentResponse>.error(chuckDatas.message));
    } catch (e) {
      GlobalFunc.logPrint("Error $e");
      _chuckListController.add(Response<UpdateAppointmentResponse>.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}