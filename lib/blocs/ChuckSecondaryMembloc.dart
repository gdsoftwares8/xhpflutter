import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/models/secondary_member_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckSecondartMemberRepo.dart';


class ChuckSecondaryMemberbloc {
  ChuckSecondaryMemberRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<SecondaryMemberResponse>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<SecondaryMemberResponse>> get chuckListStream =>
      _chuckListController.stream;

  ChuckSecondaryMemberbloc(String memberId) {
    _chuckListController = StreamController<Response<SecondaryMemberResponse>>();
    _chuckRepository = ChuckSecondaryMemberRepository();
    fetchSecondaryMembers(memberId);
  }

  fetchSecondaryMembers(String memberId) async {
    chuckListSink.add(Response.loading('Getting SecondaryMembers.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);
      SecondaryMemberResponse chuckDatas =
      await _chuckRepository.fetchSecondaryMembers(queryParams: map);
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