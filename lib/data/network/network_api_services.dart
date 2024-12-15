import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:innovabe_solutions_api/data/app_exceptions.dart';
import 'package:innovabe_solutions_api/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiServices(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Time Out Exception');
    }
  }

  @override
  Future getPostApiServices(String url, dynamic data,
      {Map<String, String>? headers}) async {
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Time Out Exception');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequetException(response.body.toString());

      case 404:
        throw UnAuthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code ${response.statusCode}');
    }
  }
}
