import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/contribution_response.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckContributionRepository.dart';

class ChuckContributionbloc {
  ChuckContributionRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<ContributionResponse>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<ContributionResponse>> get chuckListStream =>
      _chuckListController.stream;

  ChuckContributionbloc(String memberId) {
    _chuckListController = StreamController<Response<ContributionResponse>>();
    _chuckRepository = ChuckContributionRepository();
    fetchContributions(memberId);
  }

  fetchContributions(String memberId) async {
    chuckListSink.add(Response.loading('Getting Contributions.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);
      ContributionResponse chuckDatas =
      await _chuckRepository.fetchContributions(queryParams: map);
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