import 'package:xhp/models/login_response.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckLoginRepository {
  ApiProvider _provider = ApiProvider();

  Future<LoginResponce> fetchLogin({Map<String, dynamic> postParams}) async {
    final response = await _provider.post(GlobalVars.LOGIN_URL,postParams: postParams);
   // print(response);
    return LoginResponce.fromJson(response);

  }
}
