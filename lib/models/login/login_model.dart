class UserModel {
  String? token;
  String? name;

  UserModel({this.token, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['access_token'];
    name = json['user'] != null ? json['user']['name'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = token;
    data['name'] = name;
    return data;
  }
}
