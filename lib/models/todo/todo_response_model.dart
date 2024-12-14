class TodoResponseModel {
  int? status;
  String? message;
  int? id;

  TodoResponseModel({this.status, this.message, this.id});

  TodoResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
