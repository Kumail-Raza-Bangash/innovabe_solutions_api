import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/models/todo/todo_list_model.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';
import 'package:innovabe_solutions_api/view_model/services/user_preferences/user_preferences.dart';

class TodoListRepository {
  final _apiServices = NetworkApiServices();
  final _userPreferences = UserPreferences();

  Future<List<TodoListModel>> todoListApi() async {
    // Retrieve bearer token from UserPreferences
    var user = await _userPreferences.getUser();
    String? bearerToken = user.accessToken;

    // Make the API call with the token
    dynamic response = await _apiServices.getGetApiServices(
      AppUrl.todoListUrl,
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
    );

    // Handle the API response
    if (response is Map<String, dynamic> && response.containsKey('data')) {
      return (response['data'] as List)
          .map((item) => TodoListModel.fromJson(item))
          .toList();
    } else {
      throw Exception("Unexpected API response format");
    }
  }
}
