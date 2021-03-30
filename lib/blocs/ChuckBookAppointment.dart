import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckBookAppointmentRepository.dart';
import 'package:xhp/utils/GlobalFuncs.dart';

class ChuckBookAppointmentbloc {
  ChuckBookAppointmentRepository _chuckRepository;
  StreamController _chuckListController;
  bool _isStreaming;

  StreamSink<Response<AppointmentResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<AppointmentResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckBookAppointmentbloc(String memberId, String fkId, String preferredTime, String preferredDate,String isRebate,
     String   company, String service_category,String company_membership_no) {
    _chuckListController = StreamController<Response<AppointmentResponce>>();
    _chuckRepository = ChuckBookAppointmentRepository();
    _isStreaming = true;
    fetchBookAppointmets(memberId, fkId, preferredTime, preferredDate, isRebate,
        company, service_category, company_membership_no);
  }

  fetchBookAppointmets(String memberId, String fkId, String preferredTime, String preferredDate,String isRebate,
     String   company, String service_category,String company_membership_no )async {
    // GlobalFunc.logPrint("fetchAppointmets $memberId");
    chuckListSink.add(Response.loading('Getting Appointments.'));
    try {
      Map<String, String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);
       map.putIfAbsent("fk_id_member", () => fkId);
        map.putIfAbsent("preferred_time", () => preferredTime);
         map.putIfAbsent("preferred_date", () => preferredDate);
          map.putIfAbsent("is_phi_rebate", () => isRebate);
           map.putIfAbsent("company", () => company);
            map.putIfAbsent("fk_id_service_category", () => service_category);//company_membership_no
             map.putIfAbsent("company_membership_no", () => company_membership_no);

      AppointmentResponce chuckDatas =
          await _chuckRepository.fetchAppointments(postParams: map);
      // GlobalFunc.logPrint("chuckDatas $chuckDatas");
      if (chuckDatas.status == 1) if (_isStreaming)
        chuckListSink.add(Response.completed(chuckDatas));
      else if (_isStreaming)
        chuckListSink.add(Response.error(chuckDatas.message));
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
