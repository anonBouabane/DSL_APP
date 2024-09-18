import 'package:dio/dio.dart';
import 'package:dslsale/util/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCustomerRepo {
  final Dio _dio = Dio();
  Future<List<dynamic>?> fetchcustomer() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    String? token = prefers.getString('accessToken');

    Options options = Options(headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    try {
      final response =
          await _dio.post(AppConstant.getAllCustomerUrl, options: options);
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      throw Exception("err to conect");
    }
    return null;
  }
}
