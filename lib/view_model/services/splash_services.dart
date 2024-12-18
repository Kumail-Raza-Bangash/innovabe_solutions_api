// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/view_model/services/user_preferences/user_preferences.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isSuccess() {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAndToNamed(RoutesName.loginView),
    );
  }
}
