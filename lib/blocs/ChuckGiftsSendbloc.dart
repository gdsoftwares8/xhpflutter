import 'dart:async';
import 'dart:collection';


import 'package:xhp/models/gift_send_response.dart';

import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckGiftSendRepo.dart';

import 'package:xhp/utils/GlobalFuncs.dart';


class ChuckGiftSendbloc {
  ChuckGiftSendRepository _chuckRepository;
  StreamController _chuckListController = StreamController<Response<GiftSendResponse>>();

  Stream<Response<GiftSendResponse>> get chuckListStream =>
      _chuckListController.stream;

  ChuckGiftSendbloc() {
   // _chuckListController = StreamController.broadcast();
    _chuckRepository = ChuckGiftSendRepository();
  }

  fetchGiftSend(String name, String memberId,String email,String amount) async {
  //  _chuckListController.add("test");
   _chuckListController.add(Response<GiftSendResponse>.loading('Getting GiftSend.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("name", () => name);
       map.putIfAbsent("amount", () => amount);
      map.putIfAbsent("email", () => email);
      map.putIfAbsent("member_id", () => memberId);
     // map.putIfAbsent("member_id", () => memberId);
      GiftSendResponse chuckDatas =
      await _chuckRepository.fetchGiftSend(postParams: map);
    //  GlobalFunc.logPrint("GiftSend Responce $chuckDatas");
      if(chuckDatas.status == 1)
        _chuckListController.add(Response<GiftSendResponse>.completed(chuckDatas));
      else
        _chuckListController.add(Response<GiftSendResponse>.error(chuckDatas.message));
    } catch (e) {
      GlobalFunc.logPrint("Error $e");
      _chuckListController.add(Response<GiftSendResponse>.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}