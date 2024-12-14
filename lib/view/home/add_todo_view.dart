import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/view_model/controller/todo/todo_view_model.dart';

class AddTodoView extends StatelessWidget {
  final TodoViewModel todoViewModel = Get.put(TodoViewModel());

  AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: todoViewModel.titleController.value,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: todoViewModel.descriptionController.value,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                todoViewModel.addTodo();
              },
              child: const Text("Add Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
