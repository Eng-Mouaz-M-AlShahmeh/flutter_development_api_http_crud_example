/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:api_http_crud_example/controllers/services/api.dart';
import 'package:flutter/material.dart';
import 'package:api_http_crud_example/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  // TODO: program your provider as you want
  // initialize data
  String? _title;
  String? _completed;
  List<TodoModel?> _listTodos = [];
  TodoModel? _selectedTodo;
  int _loading = 0;

  // setters
  setTitle(String val) async {
    _title = val;
    notifyListeners();
  }

  setCompleted(String val) async {
    _completed = val;
    notifyListeners();
  }

  selectTodo(TodoModel val) async {
    _selectedTodo = val;
    notifyListeners();
  }

  getAllTodos(BuildContext context) async {
    _loading = 1;
    Future.delayed(const Duration(milliseconds: 0), () {
      _listTodos = [];
      Api().getAllTodos(context).then((value) {
        if (value != null) {
          for (var e in value) {
            _listTodos.add(TodoModel.fromJson(e));
          }
          _loading = 0;
          notifyListeners();
          return;
        } else {
          _loading = 0;
          notifyListeners();
          return;
        }
      });
    });
  }

  addToList(TodoModel val) async {
    // TODO: complete update function api with real api server or local host
    notifyListeners();
  }

  removeFromList(String id) async {
    // TODO: complete delete function api with real api server or local host
    notifyListeners();
  }

  updateList(TodoModel val) async {
    // TODO: complete update function api with real api server or local host
    notifyListeners();
  }

  // getters
  String? get title => _title;
  String? get completed => _completed;
  List<TodoModel?> get listTodos => _listTodos;
  TodoModel? get selectedTodo => _selectedTodo;
  int? get loading => _loading;
}
