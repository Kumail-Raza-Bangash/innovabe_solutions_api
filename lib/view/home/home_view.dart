import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/view/home/add_todo_view.dart';
import 'package:innovabe_solutions_api/view_model/controller/home/home_view_model.dart';
import 'package:innovabe_solutions_api/view_model/controller/todo/todo_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeViewModel());
  bool isLoading = true;
  final TodoViewModel todoViewModel = Get.put(TodoViewModel());

  @override
  void initState() {
    homeController.loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    todoViewModel.getTodos();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                homeController.userName.value,
                style: TextStyle(
                    color: AppColor.whiteColor, fontSize: Dimensions.font26),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => AddTodoView());
                  },
                  icon: const Icon(Icons.add, color: AppColor.whiteColor),
                ),
                SizedBox(width: Dimensions.width10 / 2),
                IconButton(
                  onPressed: () {
                    homeController.logout();
                  },
                  icon: const Icon(Icons.logout, color: AppColor.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (todoViewModel.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (todoViewModel.todos.isEmpty) {
          return const Center(child: Text("No Todos Found"));
        }
        return ListView.builder(
          itemCount: todoViewModel.todos.length,
          itemBuilder: (context, index) {
            final todo = todoViewModel.todos[index];
            return ListTile(
              title: Text(todo.name ?? "No Title"),
              subtitle: Text(todo.value ?? "No Description"),
            );
          },
        );
      }),
    );
  }
}
