import 'dart:async';
import 'dart:collection';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/gift_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckGiftsRepository.dart';

class ChuckGiftbloc {
  ChuckGiftsRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<GiftResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<GiftResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckGiftbloc(String memberId) {
    _chuckListController = StreamController<Response<AppointmentResponce>>();
    _chuckRepository = ChuckGiftsRepository();
    fetchGifts(memberId);
  }

  fetchGifts(String memberId) async {
    chuckListSink.add(Response.loading('Getting Gifts.'));
    try {
      Map<String,String> map = HashMap();
      map.putIfAbsent("member_id", () => memberId);

      GiftResponce chuckDatas =
      await _chuckRepository.fetchGifts(queryParams: map);
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