class AddTodoModel {
  int? status;
  String? message;
  int? id;

  AddTodoModel({this.status, this.message, this.id});

  AddTodoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}
