import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/widgets/general_exception_widget.dart';
import 'package:innovabe_solutions_api/resourses/widgets/internet_exception_widget.dart';
import 'package:innovabe_solutions_api/view/home/home_ui.dart';
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
    homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryButtonColor,
          ),
        ),
      ),
      body: Obx(
        () {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              );
            case Status.COMPLETED:
              return const Center(
                child: HomeUI(),
              );
            case Status.ERROR:
              if (homeController.error.value == 'No internet') {
                return Center(
                  child: InternetExceptionWidget(
                    onPress: () {
                      homeController.refreshApi();
                    },
                  ),
                );
              } else {
                return Center(
                  child: GeneralExceptionWidget(
                    onPress: () {
                      homeController.refreshApi();
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
