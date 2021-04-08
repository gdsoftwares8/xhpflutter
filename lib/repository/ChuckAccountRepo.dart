import 'package:xhp/models/account_response.dart';
import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckAccountRepository {
  ApiProvider _provider = ApiProvider();

  Future<AccountResponse> fetchAccounts(
      {
        Map<String, String> queryParams
      }) async {
    GlobalFunc.logPrint("ChuckAccountRepository $queryParams");
    final response = await _provider.get(GlobalVars.ACCOUNT_URL, queryParams: queryParams);
    GlobalFunc.logPrint(" res is $response");
    return AccountResponse.fromJson(response);
  }
}