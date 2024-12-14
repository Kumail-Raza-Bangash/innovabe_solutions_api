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

    try {
      // Fetch user token (ensure you have a valid token)
      UserPreferences().getUser().then((user) async {
        final response = await _todoRepo.getTodos(user.token!);

        // Map response to TodoModel
        todos.value = response
            .map((todo) => TodoModel.fromJson(todo))
            .toList();

        // Log fetched todos
        print("Todos Fetched: ${todos.length}");
      });
    } catch (e) {
      print("Error Fetching Todos: $e");
      Utils.snackBar("Error", e.toString());
    } finally {
      loading.value = false;
    }
    
  }

  Future<void> postTodo() async {
    UserPreferences().getUser().then((user) async {
      try {
        // Prepare the data
        Map<String, String> data = {
          'name': titleController.value.text,
        };

        // Call the repository to send the POST request
        await _todoRepo.postTodo(user.token!, data);

        Utils.snackBar("Success", "Todo Added Successfully");

        // Refresh todos after adding
        await getTodos();
        Get.back();
      } catch (e) {
        Utils.snackBar("Error", e.toString());
      }
    });
  }
}
