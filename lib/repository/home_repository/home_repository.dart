import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/models/home/user_list_model.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';

class HomeRepository{
  final _apiServices = NetworkApiServices();

  Future<dynamic> userListApi() async {
    dynamic response = await _apiServices.getGetApiServices(AppUrl.todoUrl);
    return UserListModel.fromJson(response);
  }
}