import 'dart:async';
import 'dart:collection';
import 'package:xhp/models/signupfirst_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckSignupFirstRepo.dart';

import 'package:xhp/utils/GlobalFuncs.dart';


class ChuckSignupFirstbloc {
  ChuckSignupFirstRepository _chuckRepository;
  StreamController _chuckListController = StreamController<Response<SignupFirstResponce>>();

  Stream<Response<SignupFirstResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckSignupFirstbloc() {
   // _chuckListController = StreamController.broadcast();
    _chuckRepository = ChuckSignupFirstRepository();
  }

  fetchSignupFirst(String username, String password) async {
  //  _chuckListController.add("test");
   _chuckListController.add(Response<SignupFirstResponce>.loading('Getting SignupFirst.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("username", () => username);
      map.putIfAbsent("password", () => password);
     // map.putIfAbsent("member_id", () => memberId);
      SignupFirstResponce chuckDatas =
      await _chuckRepository.fetchSignupFirst(postParams: map);
    //  GlobalFunc.logPrint("SignupFirst Responce $chuckDatas");
      if(chuckDatas.status == 1)
        _chuckListController.add(Response<SignupFirstResponce>.completed(chuckDatas));
      else
        _chuckListController.add(Response<SignupFirstResponce>.error(chuckDatas.message));
    } catch (e) {
      GlobalFunc.logPrint("Error $e");
      _chuckListController.add(Response<SignupFirstResponce>.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}