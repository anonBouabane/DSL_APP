import 'package:dio/dio.dart';
import 'package:dslsale/util/app_constant.dart';

class AuthRepo {
  final dio = Dio();

  Future<dynamic> login(
      {required String username, required String password}) async {
    try {
      final data = {"username": username, "user_password": password};
      final response = await dio.post(AppConstant.loginUrl, data: data);
      if (response.statusCode == 200) {
        return data;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
