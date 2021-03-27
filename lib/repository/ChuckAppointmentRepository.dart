import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/utils/global_vars.dart';

class ChuckAppointmentRepository {
  ApiProvider _provider = ApiProvider();

  Future<AppointmentResponce> fetchAppointments(
      {
        Map<String, dynamic> queryParams
      }) async {
    final response = await _provider.get(GlobalVars.APPOINTMENTS_URL, queryParams: queryParams);
    return AppointmentResponce.fromJson(response);
  }
}