import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(LoginModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('access_token', responseModel.accessToken ?? '');
    sp.setString('name', responseModel.user?.name ?? '');
    return true;
  }

  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('access_token');
    String? name = sp.getString('name');
    return LoginModel(accessToken: token, user: User(name: name));
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
