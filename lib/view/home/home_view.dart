import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/view_model/controller/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeViewModel());

  @override
  void initState() {
    homeController.loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "HOME PAGE ",
              style: TextStyle(color: AppColor.whiteColor),
            ),
            InkWell(
              onTap: () {
                homeController.logout();
              },
              child: const Text(
                "LOG OUT ",
                style:
                    TextStyle(color: AppColor.whiteColor),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Welcome, ",
            style: TextStyle(color: AppColor.primaryTextColor, fontSize: 20),
          ),
          Obx(
            () => Text(
              homeController.userName.value,
              style:
                  const TextStyle(color: AppColor.primaryColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
