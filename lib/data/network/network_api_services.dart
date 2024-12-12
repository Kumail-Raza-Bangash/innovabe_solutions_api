import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:innovabe_solutions_api/data/app_exceptions.dart';
import 'package:innovabe_solutions_api/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiServices(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Time Out Exception');
    }
    return responseJson;
  }

  @override
  Future getPostApiServices(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http.post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Exception');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Time Out Exception');
    }
    if(kDebugMode){
      print(responseJson);
    }
    return responseJson;
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

      case 500:
      default:
        throw FetchDataException(
            'Error occured while communicating with server with status code ${response.statusCode}');
    }
  }
}