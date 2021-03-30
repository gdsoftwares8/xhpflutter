import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/login_response.dart';

import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/LoginResponse.dart';


class ChuckLoginbloc {
  ChuckLoginRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<LoginResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<LoginResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckLoginbloc() {
    _chuckListController = StreamController<Response<LoginResponce>>();
    _chuckRepository = ChuckLoginRepository();
  }

  fetchLogin(String username, String password) async {
    chuckListSink.add(Response.loading('Getting Login.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("username", () => username);
      map.putIfAbsent("password", () => password);
     // map.putIfAbsent("member_id", () => memberId);
      LoginResponce chuckDatas =
      await _chuckRepository.fetchLogin(postParams: map);
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