// ignore_for_file: unnecessary_this, prefer_collection_literals

class RegisterUserModel {
  String? token;

  RegisterUserModel({this.token});

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
