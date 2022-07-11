/* Developed by: Eng Mouaz M. Al-Shahmeh */
class TodoModel {
  String? id;
  String? title;
  String? completed;

  TodoModel({this.id, this.title, this.completed});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'].toString();
    completed = json['completed'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
