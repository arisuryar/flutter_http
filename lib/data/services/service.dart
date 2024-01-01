import 'dart:convert';

import 'package:flutter_http/data/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<User> getUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body) as Map<String, dynamic>);
      return User.fromJson(json);
    } else {
      throw Exception('Failed Get Data');
    }
  }

  Future<User> createUser(String name, String username, String phone) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'username': username,
        'phone': phone,
      }),
    );
    if (response.statusCode == 201) {
      final json = (jsonDecode(response.body) as Map<String, dynamic>);
      return User.fromJson(json);
    } else {
      throw Exception('Failed to Create User');
    }
  }

  Future<User> updateUser(String name, String username, String phone) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'username': username,
        'phone': phone,
      }),
    );
    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body) as Map<String, dynamic>);
      return User.fromJson(json);
    } else {
      throw Exception('Failed to Updating User');
    }
  }

  Future<User> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      throw 'Success';
    } else {
      throw Exception('Failed to Delete User');
    }
  }
}
