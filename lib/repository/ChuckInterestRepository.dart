import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/contribution_response.dart';
import 'package:xhp/models/interest_response.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckInterestRepository {
  ApiProvider _provider = ApiProvider();

  Future<InterestResponse> fetchInterests({Map<String, dynamic> queryParams}) async {
    final response = await _provider.get(GlobalVars.INTEREST_URL,queryParams: queryParams);
    return InterestResponse.fromJson(response);
  }
}
