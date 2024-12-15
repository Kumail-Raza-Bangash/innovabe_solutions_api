import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/models/todo/todo_list_model.dart';
import 'package:innovabe_solutions_api/repository/todo_repo/todo_list_repo.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/services/user_preferences/user_preferences.dart';

class TodoListViewModel extends GetxController {
  final apiServices = NetworkApiServices();
  final userPreferences = UserPreferences();

  RxList<TodoListModel> todoList = <TodoListModel>[].obs;
  Rx<Status> rxRequestStatus = Status.LOADING.obs;
  final _api = TodoListRepository();

  void todoListApi() async {
    try {
      rxRequestStatus.value = Status.LOADING;

      var response = await _api.todoListApi();
      var responseData = response as List;

      todoList.value =
          responseData.map((item) => TodoListModel.fromJson(item)).toList();

      rxRequestStatus.value = Status.COMPLETED;
    } catch (e) {
      Utils.snackBar("Error", e.toString());
      rxRequestStatus(Status.ERROR);
    }
  }
}
