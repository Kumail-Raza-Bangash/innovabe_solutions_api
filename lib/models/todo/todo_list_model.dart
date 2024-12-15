class TodoListModel {
  int? id;
  String? user;
  String? value;
  String? status;
  String? createdAt;
  String? updatedAt;

  TodoListModel({
    this.id,
    this.user,
    this.value,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create an instance from JSON
  factory TodoListModel.fromJson(Map<String, dynamic> json) {
    return TodoListModel(
      id: json['id'],
      user: json['user'],
      value: json['value'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
