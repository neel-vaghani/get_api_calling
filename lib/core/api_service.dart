// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/user_model.dart';

class ApiService {
  // Dio Object
  final Dio _dio = Dio();

  Future<List<User>> getUser() async {
    List<User>? usersList;
    try {
      Response userData = await _dio
          .get("https://verified-mammal-79.hasura.app/api/rest/users/0");
      print('User Info: ${userData.data}');
      usersList = welcomeFromJson(jsonEncode(userData.data)).users;

      return usersList ?? [];
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      return [];
    }
  }
}
