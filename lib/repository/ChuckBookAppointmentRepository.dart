import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckBookAppointmentRepository {
  ApiProvider _provider = ApiProvider();

  Future<AppointmentResponce> fetchAppointments(
      {
        Map<String, String> postParams
      }) async {
    GlobalFunc.logPrint("ChuckBookAppointmentRepository $postParams");
    final response = await _provider.post(GlobalVars.BOOK_APPOINTMENT_URL, postParams: postParams);
    GlobalFunc.logPrint(" res is $response");
    return AppointmentResponce.fromJson(response);
  }
}