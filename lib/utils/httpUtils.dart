import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'LoggingInterceptor.dart';

class HttpUtils {

  static Map<String, String> getHeaders() {
    return  {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      /*'Authorization': '<Your token>'*/
    };
  }

  static getClient() {
    return HttpClientWithInterceptor.build(
        interceptors: [LoggingInterceptor(),]
    );
  }
}