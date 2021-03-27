
import 'package:http_interceptor/http_interceptor.dart';
import 'package:xhp/utils/GlobalFuncs.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
   // GlobalFunc.logPrint(data.toString());
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // GlobalFunc.logPrint(data.url);
    // GlobalFunc.logPrint(data.body);
    print(data);
    return data;
  }

}