/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // TODO: preferred to define base url first in class and use it later in any place
  String baseURL = 'https://jsonplaceholder.typicode.com';

  // TODO: if exists api key preferred to define first as base url
  // String apiKey = '';

  // TODO: add get all todos api function to dummy api server data
  Future<dynamic> getAllTodos(BuildContext context) async {
    Uri? url = Uri.tryParse('$baseURL/todos');
    var response = await http.get(url!, headers: {});
    if (response.statusCode == 200) {
      var jsonx = json.decode(response.body);
      if (jsonx != null) {
        return jsonx;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  // TODO: add get todo by id api function to dummy api server data
  // Future<dynamic> getTodoById(BuildContext context, String id) async {
  //   // Uri? url = Uri.tryParse('$baseURL/todos');
  //   // var response = await http.get(url!, headers: {'id': id});
  //   // if (response.statusCode == 200) {
  //   //   var jsonx = json.decode(response.body);
  //   //   return jsonx['data'];
  //   // } else {
  //   //   return false;
  //   // }
  // }

  // TODO: make real post api function with real server or local host
  // Future<dynamic> postNewTodo(BuildContext context) async {
  //   // Uri? url = Uri.tryParse('$baseURL/todos');
  //   // var response = await http.post(url!, headers: {}, body: {});
  //   // if (response.statusCode == 201) {
  //   //   var jsonx = json.decode(response.body);
  //   //   return jsonx['data'];
  //   // } else {
  //   //   return false;
  //   // }
  // }

  // TODO: make real edit api function with real server or local host
  // Future<dynamic> editTodo(BuildContext context) async {
  //   // Uri? url = Uri.tryParse('$baseURL/todos');
  //   // var response = await http.put(url!, headers: {}, body: {});
  //   // if (response.statusCode == 201) {
  //   //   var jsonx = json.decode(response.body);
  //   //   return jsonx['data'];
  //   // } else {
  //   //   return false;
  //   // }
  // }

  // TODO: make real delete api function with real server or local host
  // Future<dynamic> deleteTodo(BuildContext context) async {
  //   // Uri? url = Uri.tryParse('$baseURL/todos');
  //   // var response = await http.delete(url!, headers: {}, body: {});
  //   // if (response.statusCode == 200) {
  //   //   var jsonx = json.decode(response.body);
  //   //   return jsonx['data'];
  //   // } else {
  //   //   return false;
  //   // }
  // }
}
