import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:xhp/blocs/ChuckLocalData.dart';
import 'package:xhp/models/account_response.dart';
import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAccountRepo.dart';

import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/SharedPref.dart';

class ChuckAccountbloc {
  ChuckAccountRepository _chuckRepository;
  StreamController _chuckListController;
  bool _isStreaming;
  SharedPref sharedPref = SharedPref();

  StreamSink<Response<AccountResponse>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<AccountResponse>> get chuckListStream =>
      _chuckListController.stream;

  ChuckAccountbloc(String memberId) {
    _chuckListController = StreamController<Response<AccountResponse>>();
    _chuckRepository = ChuckAccountRepository();
    _isStreaming = true;
    fetchAccounts(memberId);
  }

  fetchAccounts(String memberId) async {
    // GlobalFunc.logPrint("fetchAppointmets $memberId");
    chuckListSink.add(Response.loading('Getting Accounts.'));
    try {
      Map<String, String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);

      AccountResponse chuckDatas =
          await _chuckRepository.fetchAccounts(queryParams: map);
      // GlobalFunc.logPrint("chuckDatas $chuckDatas");
      if (chuckDatas.status == 1) {
        GlobalFunc.saveAccountData(chuckDatas.result, sharedPref);
        ChuckLocalData.saveUser(chuckDatas.result);
        if (_isStreaming) {
          chuckListSink.add(Response.completed(chuckDatas));
        } else if (_isStreaming) {
          chuckListSink.add(Response.error(chuckDatas.message));
        }
      }
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
