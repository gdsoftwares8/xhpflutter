import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/models/secondary_member_response.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckSecondaryMemberRepository {
  ApiProvider _provider = ApiProvider();

  Future<SecondaryMemberResponse> fetchSecondaryMembers({Map<String, dynamic> queryParams}) async {
    final response = await _provider.get(GlobalVars.SECONDARY_MEMBER_URL,queryParams: queryParams);
    return SecondaryMemberResponse.fromJson(response);
  }
}
