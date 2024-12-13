// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:innovabe_solutions_api/data/response/status.dart';
import 'package:innovabe_solutions_api/models/home/user_list_model.dart';
import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:innovabe_solutions_api/repository/home_repository/home_repository.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/view_model/controller/user_preferences/user_preferences.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserListModel value) => userList.value = value;
  void setError(String value) => error.value = value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

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
