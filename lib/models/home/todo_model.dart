class TodoModel {
  int? id;
  String? name;
  String? value;

  TodoModel({this.id, this.name, this.value});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
