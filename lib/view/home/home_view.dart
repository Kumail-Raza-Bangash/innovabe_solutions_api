import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/view_model/controller/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeViewModel());
  bool isLoading = true;

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
            Obx(
              () => Text(
                homeController.userName.value,
                style: TextStyle(
                    color: AppColor.whiteColor, fontSize: Dimensions.font20),
              ),
            ),
            InkWell(
              onTap: () {
                homeController.logout();
              },
              child: Text(
                "LOG OUT ",
                style: TextStyle(
                    color: AppColor.whiteColor, fontSize: Dimensions.font20),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.all(Dimensions.height10),
        itemBuilder: (context, index) {
          return Card(
            color: AppColor.whiteColor,
            elevation: 0.5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: AppColor.blackColor),
                ),
              ),
              textColor: AppColor.blackColor,
              title: const Text(
                'Title',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: const Text(
                'description',
                style: TextStyle(color: AppColor.blackColor),
              ),
              trailing: const Row(
                children: [
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
