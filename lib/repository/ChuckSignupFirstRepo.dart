import 'package:xhp/models/signupfirst_response.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckSignupFirstRepository {
  ApiProvider _provider = ApiProvider();

  Future<SignupFirstResponce> fetchSignupFirst({Map<String, dynamic> postParams}) async {
    final response = await _provider.post(GlobalVars.SIGNUP_FIRST_URL,postParams: postParams);
   // print(response);
    return SignupFirstResponce.fromJson(response);

  }
}
