import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:innovabe_solutions_api/repository/register_repo/register_repo.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/controller/user_preferences/user_preferences.dart';

class RegisterController extends GetxController {
  UserPreferences userPreferences = UserPreferences();

  final _api = RegisterRepository();
  RxBool loading = false.obs;

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final conformPasswordController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final conformPasswordFocusNode = FocusNode().obs;

  void registerApi() async {
    loading.value = true;
    Map data = {
      'name': nameController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'password_confirmation': conformPasswordController.value.text,
    };
    _api.registerApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar("Register", value['error']);
      } else {
        userPreferences.saveUser(LoginModel.fromJson(value)).then((value) {
          Get.offAndToNamed(RoutesName.loginView);
        }).onError((error, stackTrace) {});
        Utils.snackBar("Register", 'Register Successfully');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
