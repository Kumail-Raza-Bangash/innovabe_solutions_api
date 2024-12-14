// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/view_model/controller/user_preferences/user_preferences.dart';

class HomeViewModel extends GetxController {
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  UserPreferences userPreferences = UserPreferences();

  RxString userName = ''.obs;

  void loadUserData() async {
    UserModel user = await userPreferences.getUser();
    userName.value = user.name ?? 'Guest';
  }

  void logout() async {
    UserModel user = await userPreferences.getUser();
    String? token = user.token;

    // Logic to send logout request using token

    // Clear user data after API call
    await userPreferences.removeUser();
    Get.offAllNamed(RoutesName.loginView);
  }
}
