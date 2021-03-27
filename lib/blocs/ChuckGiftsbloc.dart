import 'dart:async';

import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/gift_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/repository/ChuckAppointmentRepository.dart';
import 'package:xhp/repository/ChuckGiftsRepository.dart';

class ChuckAppointmentbloc {
  ChuckGiftsRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<GiftResponce>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<GiftResponce>> get chuckListStream =>
      _chuckListController.stream;

  ChuckCategoryBloc() {
    _chuckListController = StreamController<Response<AppointmentResponce>>();
    _chuckRepository = ChuckGiftsRepository();
    fetchGifts();
  }

  fetchGifts() async {
    chuckListSink.add(Response.loading('Getting Gifts.'));
    try {
      GiftResponce chuckDatas =
      await _chuckRepository.fetchGifts();
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