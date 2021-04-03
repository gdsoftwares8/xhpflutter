import 'dart:async';
import 'dart:collection';

import 'package:get/get.dart';
import 'package:xhp/blocs/ChuckLocalData.dart';
import 'package:xhp/models/login_response.dart';

import 'package:xhp/networking/Response.dart' as res;
import 'package:xhp/repository/ChuckLoginRepo.dart';

import 'package:xhp/utils/GlobalFuncs.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

class ChuckLoginbloc {
  User user;
  ChuckLoginRepository _chuckRepository;
  StreamController _chuckListController =
      StreamController<res.Response<LoginResponce>>();

  Stream<res.Response<LoginResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckLoginbloc() {
    // _chuckListController = StreamController.broadcast();
    _chuckRepository = ChuckLoginRepository();
  }

  fetchLogin(String username, String password) async {
    //  _chuckListController.add("test");
    _chuckListController
        .add(res.Response<LoginResponce>.loading('Getting Login.'));
    try {
      Map<String, String> map = HashMap();
      map.putIfAbsent("username", () => username);
      map.putIfAbsent("password", () => password);
      // map.putIfAbsent("member_id", () => memberId);

      await _chuckRepository
          .fetchLogin(postParams: map)
          .then((LoginResponce chuckDatas) {
        if (chuckDatas.status == 1) {
          ChuckLocalData.saveUser(chuckDatas.userData);
          _chuckListController
              .add(res.Response<LoginResponce>.completed(chuckDatas));
        } else {
          _chuckListController
              .add(res.Response<LoginResponce>.error(chuckDatas.message));
        }
      });
      //  GlobalFunc.logPrint("Login Responce $chuckDatas");

    } catch (e) {
      GlobalFunc.logPrint("Error $e");
      _chuckListController.add(res.Response<LoginResponce>.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}
