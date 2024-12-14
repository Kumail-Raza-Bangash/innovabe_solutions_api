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

  Future<void> fetchTodos() async {
    loading.value = true;
    UserPreferences().getUser().then((user) async {
      try {
        todos.value = await _todoRepo.fetchTodos(user.token!);
      } catch (e) {
        Utils.snackBar("Error", e.toString());
      } finally {
        loading.value = false;
      }
    });
  }

  Future<void> addTodo() async {
    UserPreferences().getUser().then((user) async {
      try {
        TodoModel todo = TodoModel(
          title: titleController.value.text,
          description: descriptionController.value.text,
        );
        await _todoRepo.addTodo(user.token!, todo);
        Utils.snackBar("Success", "Todo Added Successfully");
        await fetchTodos(); // Refresh todos after adding
        Get.back();
      } catch (e) {
        Utils.snackBar("Error", e.toString());
      }
    });
  }
}
