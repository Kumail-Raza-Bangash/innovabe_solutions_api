import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:innovabe_solutions_api/repository/login_repo/login_repo.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/controller/user_preferences/user_preferences.dart';

class LoginViewModel extends GetxController {
  UserPreferences userPreferences = UserPreferences();

  final _api = LoginRepository();
  RxBool loading = false.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() async {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['status'] != 200) {
        Utils.snackBar("Login", value['message'] ?? 'Error occurred');
      } else {
        UserModel userModel = UserModel.fromJson(value);
        userPreferences.saveUser(userModel).then((_) {
          Get.offAndToNamed(RoutesName.homeView);
        }).onError((error, stackTrace) {
          Utils.snackBar("Error", error.toString());
        });
        Utils.snackBar("Login", 'Login Successfully');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
