import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dslsale/data/Model/auth_model.dart';
import 'package:dslsale/util/app_constant.dart';

class AuthRepo {
  final dio = Dio();

  Future<AuthModel> login(
      {required String username, required String password}) async {
    try {
      final data = jsonEncode(
          <String, String>{"username": username, "user_password": password});
      final response = await dio.post(AppConstant.loginUrl, data: data);
      if (response.statusCode == 200) {
        return AuthModel.fromJson(json.decode(response.toString()));
      }
    } catch (e) {
      rethrow;
    }
    return throw e;
  }
}
