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
    try {
      LoginModel user = await userPreferences.getUser();
      userName.value = user.user?.name ?? "Guest";
    } catch (e) {
      setError("Failed to load user data: $e");
    }
  }

  void logout() async {
    try {
      LoginModel user = await userPreferences.getUser();
      String? token = user.accessToken; // Access the access token from LoginModel

      // Perform any token-related cleanup if necessary (e.g., API call to invalidate token)

      await userPreferences.removeUser(); // Remove user data from preferences
      Get.offAllNamed(RoutesName.loginView); // Navigate to the login screen
    } catch (e) {
      setError("Logout failed: $e");
    }
  }
}
