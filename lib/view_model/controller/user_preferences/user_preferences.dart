import 'package:innovabe_solutions_api/models/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  /// Save the user data into shared preferences
  Future<bool> saveUser(LoginModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // Save the individual fields from the LoginModel
    sp.setString('access_token', responseModel.accessToken ?? '');
    sp.setString('token_type', responseModel.tokenType ?? '');
    sp.setInt('expires_in', responseModel.expiresIn ?? 0);

    // Save user details if available
    sp.setString('user_id', responseModel.user?.id ?? '');
    sp.setString('user_name', responseModel.user?.name ?? '');

    return true;
  }

  /// Retrieve the user data from shared preferences
  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // Retrieve the saved data
    String? accessToken = sp.getString('access_token');
    String? tokenType = sp.getString('token_type');
    int? expiresIn = sp.getInt('expires_in');

    // Retrieve nested user fields
    String? userId = sp.getString('user_id');
    String? userName = sp.getString('user_name');

    // Create and return the LoginModel instance
    return LoginModel(
      accessToken: accessToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
      user: User(
        id: userId,
        name: userName,
      ),
    );
  }

  /// Remove the user data from shared preferences
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear(); // Clears all saved preferences
    return true;
  }
}
