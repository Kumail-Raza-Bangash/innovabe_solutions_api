import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/models/todo/todo_list_model.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';

class TodoListRepository {
  final _apiServices = NetworkApiServices();

  Future<TodoListModel> todoListApi() async {
    dynamic response = await _apiServices.getGetApiServices(AppUrl.todoListUrl);
    return TodoListModel.fromJson(response);
  }
}
