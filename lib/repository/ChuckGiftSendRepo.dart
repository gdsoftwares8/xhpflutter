import 'package:xhp/models/gift_send_response.dart';
import 'package:xhp/models/login_response.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckGiftSendRepository {
  ApiProvider _provider = ApiProvider();

  Future<GiftSendResponse> fetchGiftSend({Map<String, dynamic> postParams}) async {
    final response = await _provider.post(GlobalVars.ADD_GIFT_URL,postParams: postParams);
   // print(response);
    return GiftSendResponse.fromJson(response);

  }
}
