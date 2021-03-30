import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/contribution_response.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckContributionRepository {
  ApiProvider _provider = ApiProvider();

  Future<ContributionResponse> fetchContributions({Map<String, dynamic> queryParams}) async {
    final response = await _provider.get(GlobalVars.CONTRIBUTION_URL,queryParams: queryParams);
    return ContributionResponse.fromJson(response);
  }
}
