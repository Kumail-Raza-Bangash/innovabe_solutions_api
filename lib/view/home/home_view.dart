import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/view_model/home/home_view_model.dart';
import 'package:innovabe_solutions_api/view_model/todo/todo_view_model.dart';

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
      appBar: _appbar(),
      body: Obx(() {
        switch (todoListVM.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());

          case Status.ERROR:
            return Center(
                child: Text(
              "Something went wrong",
              style: TextStyle(
                fontSize: Dimensions.font20,
                color: AppColor.redColor,
              ),
            ));

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: todoListVM.todoList.length,
              itemBuilder: (context, index) {
                final todo = todoListVM.todoList[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                      vertical: Dimensions.height10,
                      horizontal: Dimensions.width15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColor.primaryColor,
                      child: Text(
                        todo.id?.toString() ?? 'N/A',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      todo.value ?? 'No Value',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.font16,
                        color: AppColor.blackColor,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Dimensions.height10 / 2),
                        Text(
                          'Status: ${todo.status ?? 'No Status'}',
                          style: TextStyle(
                            fontSize: Dimensions.font16 - 4,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.primaryColor,
                      size: Dimensions.font16,
                    ),
                    onTap: () {},
                  ),
                );
              },
            );
        }
      }),
    );
  }

  AppBar _appbar() {
    return AppBar(
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
                  Get.toNamed(RoutesName.addTodoView);
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
    );
  }
}
