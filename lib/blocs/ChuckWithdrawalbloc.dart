import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/appointment_responce.dart';

import 'package:xhp/models/withdrawal_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckWithdrawalRepo.dart';


class ChuckWithdrawalbloc {
  ChuckWithdrawalRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<WithdrawalResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<WithdrawalResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckWithdrawalbloc(String memberId) {
    _chuckListController = StreamController<Response<WithdrawalResponce>>();
    _chuckRepository = ChuckWithdrawalRepository();
    fetchWithdrawals(memberId);
  }

  fetchWithdrawals(String memberId) async {
    chuckListSink.add(Response.loading('Getting Withdrawals.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);
      WithdrawalResponce chuckDatas =
      await _chuckRepository.fetchWithdrawals(queryParams: map);
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