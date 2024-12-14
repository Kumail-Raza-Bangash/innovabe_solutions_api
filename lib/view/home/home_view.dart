import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
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
  
  final todoListVM = Get.put(TodoListViewModel());
  final homeVM = Get.put(HomeViewModel());
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    todoListVM.todoListApi();
    homeVM.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                homeVM.userName.value,
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
                    homeVM.logout();
                  },
                  icon: const Icon(Icons.logout, color: AppColor.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(() {
        switch (todoListVM.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());

          
          case Status.ERROR:
            return Center(child: Text("Something went wrong", style: TextStyle(fontSize: Dimensions.font20, color: AppColor.redColor,),));
            
          
          case Status.COMPLETED:
            return ListView.builder(
          itemCount: todoListVM.todoList.value.data!.length,
          itemBuilder: (context, index) {
            final todo = todoListVM.todoList.value.data![index];
            return ListTile(
              title: Text(todo.id.toString()),
              subtitle: Text(todo.value.toString()),
            );
          },
        );
            
          
        } 
        
      }),
    );
  }
}
