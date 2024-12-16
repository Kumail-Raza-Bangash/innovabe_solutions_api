import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/models/todo/add_todo_model.dart';
import 'package:innovabe_solutions_api/repository/todo_repo/add_todo_repo.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/services/user_preferences/user_preferences.dart';

class AddTodoViewModel extends GetxController {
  final userPreferences = UserPreferences();
  final _api = AddTodoRepository();

  RxBool loading = false.obs;

  final nameController = TextEditingController().obs;
  final valueController = TextEditingController().obs;

  void addTodoApi() async {
    loading.value = true;

    try {
      final user = await userPreferences.getUser();
      final token = user.accessToken ?? '';

      final data = {
        'name': nameController.value.text,
        'value': valueController.value.text,
      };

      final response = await _api.addTodoApi(token, data);
      AddTodoModel todoResponse = AddTodoModel.fromJson(response);

      if (todoResponse.status == 201 || todoResponse.status == 200) {
        Utils.snackBar("Success", todoResponse.message ?? "Todo added!");
        Get.toNamed(RoutesName.homeView);
      } else {
        Utils.snackBar("Failed", todoResponse.message ?? "Failed to add Todo");
      }
    } catch (e) {
      Utils.snackBar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }
}
