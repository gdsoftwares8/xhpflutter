import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/login_response.dart';

import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/LoginResponse.dart';
import 'package:xhp/utils/GlobalFuncs.dart';


class ChuckLoginbloc {
  ChuckLoginRepository _chuckRepository;
  StreamController _chuckListController = StreamController<Response<LoginResponce>>();

  Stream<Response<LoginResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckLoginbloc() {
   // _chuckListController = StreamController.broadcast();
    _chuckRepository = ChuckLoginRepository();
  }

  fetchLogin(String username, String password) async {
  //  _chuckListController.add("test");
   _chuckListController.add(Response<LoginResponce>.loading('Getting Login.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("username", () => username);
      map.putIfAbsent("password", () => password);
     // map.putIfAbsent("member_id", () => memberId);
      LoginResponce chuckDatas =
      await _chuckRepository.fetchLogin(postParams: map);
    //  GlobalFunc.logPrint("Login Responce $chuckDatas");
      if(chuckDatas.status == 1)
        _chuckListController.add(Response<LoginResponce>.completed(chuckDatas));
      else
        _chuckListController.add(Response<LoginResponce>.error(chuckDatas.message));
    } catch (e) {
      GlobalFunc.logPrint("Error $e");
      _chuckListController.add(Response<LoginResponce>.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}