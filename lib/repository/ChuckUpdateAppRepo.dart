import 'package:xhp/models/gift_send_response.dart';
import 'package:xhp/models/login_response.dart';
import 'package:xhp/models/update_app_response.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckUpdateAppointmentRepository {
  ApiProvider _provider = ApiProvider();

  Future<UpdateAppointmentResponse> fetchUpdateAppointment({Map<String, dynamic> postParams}) async {
    final response = await _provider.post(GlobalVars.UPDATE_APPOINTMENT_URL,postParams: postParams);
   // print(response);
    return UpdateAppointmentResponse.fromJson(response);

  }
}
