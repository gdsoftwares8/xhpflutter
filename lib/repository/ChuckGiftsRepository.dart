import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/gift_responce.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckGiftsRepository {
  ApiProvider _provider = ApiProvider();

  Future<GiftResponce> fetchGifts({Map<String, dynamic> queryParams}) async {
    final response = await _provider.get(GlobalVars.GIFTS_URL,queryParams: queryParams);
    return GiftResponce.fromJson(response);
  }
}