import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/models/home/todo_model.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';

class TodoRepository {
  final _apiServices = NetworkApiServices();

  Future<List<TodoModel>> getTodos(String token) async {
    dynamic response = await _apiServices.getGetApiServices(
      AppUrl.todoUrl, 
      headers: {'Authorization': 'Bearer $token'}
    );
    return (response as List).map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<dynamic> postTodo(String token, TodoModel todo) async {
    return await _apiServices.getPostApiServices(
      AppUrl.todoUrl, 
      todo.toJson(),
      headers: {'Authorization': 'Bearer $token'}
    );
  }

//   Future<dynamic> getTodos(String token) async {
//   Map<String, String> headers = {'Authorization': 'Bearer $token'};
//   return await _apiServices.getGetApiServices(AppUrl.todoUrl, headers: headers);
// }

// Future<dynamic> postTodo(String token, Map<String, dynamic> data) async {
//   Map<String, String> headers = {'Authorization': 'Bearer $token'};
//   return await _apiServices.getPostApiServices(AppUrl.todoUrl, data, headers: headers);
// }

}
