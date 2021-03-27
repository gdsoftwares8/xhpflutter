import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/LoggingInterceptor.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'CustomException.dart';


class ApiProvider {
  final String _baseUrl = "http://rupeestreet.com/xhpbackend/api/";

  Map<String, String> getHeaders() {
    return  {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      /*'Authorization': '<Your token>'*/
    };
  }

  getClient() {
    return HttpClientWithInterceptor.build(
        interceptors: [LoggingInterceptor(),]
    );
  }

  Future<dynamic> get(String url,{ Map<String, dynamic> queryParams}) async {
    var responseJson;
    try {
     // val url = Uri.http(authority, unencodedPath)
      final response = await getClient().get(Uri.parse(_baseUrl+url), params: queryParams);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        GlobalFunc.logPrint(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}