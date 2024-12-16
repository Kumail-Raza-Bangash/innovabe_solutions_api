import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';

class AddTodoRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> addTodoApi(String token, Map<String, dynamic> data) async {
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    dynamic response = await _apiServices
        .getPostApiServices(AppUrl.addTodoUrl, data, headers: headers);
    return response;
  }
}
