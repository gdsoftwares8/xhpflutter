import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/contribution_response.dart';
import 'package:xhp/models/interest_response.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckInterestRepository.dart';

class ChuckInterestbloc {
  ChuckInterestRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<InterestResponse>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<InterestResponse>> get chuckListStream =>
      _chuckListController.stream;

  ChuckInterestbloc(String memberId) {
    _chuckListController = StreamController<Response<InterestResponse>>();
    _chuckRepository = ChuckInterestRepository();
    fetchInterests(memberId);
  }

  fetchInterests(String memberId) async {
    chuckListSink.add(Response.loading('Getting Interests.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);
      InterestResponse chuckDatas =
      await _chuckRepository.fetchInterests(queryParams: map);
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