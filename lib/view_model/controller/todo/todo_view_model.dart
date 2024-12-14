import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/models/home/todo_model.dart';
import 'package:innovabe_solutions_api/repository/todo_repo/todo_repo.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/controller/user_preferences/user_preferences.dart';

class TodoViewModel extends GetxController {
  final TodoRepository _todoRepo = TodoRepository();
  RxList<TodoModel> todos = <TodoModel>[].obs;
  RxBool loading = false.obs;

  final titleController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  Future<void> getTodos() async {
    loading.value = true;
    UserPreferences().getUser().then((user) async {
      try {
        todos.value = await _todoRepo.getTodos(user.token!);
      } catch (e) {
        Utils.snackBar("Error", e.toString());
      } finally {
        loading.value = false;
      }
    });
  }

  Future<void> postTodo() async {
    UserPreferences().getUser().then((user) async {
      try {
        TodoModel todo = TodoModel(
          name: titleController.value.text,
          value: descriptionController.value.text,
        );
        await _todoRepo.postTodo(user.token!, todo);
        Utils.snackBar("Success", "Todo Added Successfully");
        await postTodo(); // Refresh todos after adding
        Get.back();
      } catch (e) {
        Utils.snackBar("Error", e.toString());
      }
    });
  }
}
