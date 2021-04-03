import 'package:xhp/models/appointment_responce.dart';

import 'package:xhp/models/withdrawal_response.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckWithdrawalRepository {
  ApiProvider _provider = ApiProvider();

  Future<WithdrawalResponce> fetchWithdrawals({Map<String, dynamic> queryParams}) async {
    final response = await _provider.get(GlobalVars.WITHDRAWAL_URL,queryParams: queryParams);
    return WithdrawalResponce.fromJson(response);
  }
}
