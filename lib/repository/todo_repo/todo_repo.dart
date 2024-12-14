import 'dart:convert';

import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';

class TodoRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<List<dynamic>> getTodos(String token) async {
    try {
      return await _apiServices.getGetApiServices(
        AppUrl.todoUrl,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postTodo(String token, Map<String, String> data) async {
    try {
      await _apiServices.getPostApiServices(
        AppUrl.createTodoUrl,
        jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
