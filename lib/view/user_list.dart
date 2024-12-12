import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/view_model/controller/home/home_view_model.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final homeController = Get.put(HomeViewModel());

  @override
  void initState() {
    homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeApi = homeController.userList.value;

    return Scaffold(
      body: ListView.builder(
          itemCount: homeApi.data!.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: ClipOval(
                  child: Image.network(
                    homeApi.data![index].avatar.toString(),
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: AppColor.primaryColor,
                        size: 20,
                      );
                    },
                    fit: BoxFit.cover,
                    width: 50,
                    height: 100,
                  ),
                ),
                title: Text(
                  '${homeApi.data![index].firstName.toString()} ${homeApi.data![index].lastName.toString()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryButtonColor,
                  ),
                ),
                subtitle: Text(
                  homeApi.data![index].email.toString(),
                  style: const TextStyle(
                    color: AppColor.secondaryTextColor,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                    'ID:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryButtonColor,
                    ),
                  ),

                  Text(
                    homeApi.data![index].id.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
