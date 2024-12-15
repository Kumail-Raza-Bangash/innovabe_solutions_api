// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/view_model/services/user_preferences/user_preferences.dart';

class HomeViewModel extends GetxController {
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  UserPreferences userPreferences = UserPreferences();

  RxString userName = ''.obs;

  void loadUserData() async {
    try {
      // LoginModel user = await userPreferences.getUser();
      // userName.value = user.user?.name ?? "Guest";
      final loginModel = await userPreferences.getUser();
      userName.value = loginModel.user?.name ?? "Unknown User";
    } catch (e) {
      // setError("Failed to load user data: $e");
      userName.value = "Error fetching user";
    }
  }

  void logout() async {
    try {
      LoginModel user = await userPreferences.getUser();
      String? token = user.accessToken; 

      await userPreferences.removeUser(); 
      Get.offAllNamed(RoutesName.loginView); 
    } catch (e) {
      setError("Logout failed: $e");
    }
  }
}
