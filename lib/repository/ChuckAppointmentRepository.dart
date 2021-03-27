import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckAppointmentRepository {
  ApiProvider _provider = ApiProvider();

  Future<AppointmentResponce> fetchAppointments(
      {
        Map<String, String> queryParams
      }) async {
    GlobalFunc.logPrint("ChuckAppointmentRepository $queryParams");
    final response = await _provider.get(GlobalVars.APPOINTMENTS_URL, queryParams: queryParams);
    //GlobalFunc.logPrint(response);
    return AppointmentResponce.fromJson(response);
  }
}