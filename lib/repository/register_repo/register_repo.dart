import 'package:innovabe_solutions_api/data/network/network_api_services.dart';
import 'package:innovabe_solutions_api/resourses/app_url/app_url.dart';

class RegisterRepository{
  final _apiServices = NetworkApiServices();

  Future<dynamic> registerApi(var data) async {
    dynamic response = await _apiServices.getPostApiServices(AppUrl.registerUrl, data);
    return response;
  }
}