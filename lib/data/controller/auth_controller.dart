import 'package:dslsale/Routehelper/route_helper.dart';
import 'package:dslsale/data/repository/auth_repository.dart';
import 'package:dslsale/message/message.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AuthController extends ChangeNotifier {
  dynamic _userData;
  dynamic get userData => _userData;
  bool _isloading = false;
  bool get loading => _isloading;
  final authRepo = AuthRepo();
  Future<void> login({required username, required password}) async {
    _isloading =true;
    try {
      
      final response =
          await authRepo.login(username: username, password: password);
      navService.goBack();
      if (response != null) {
        _userData = response;
        _isloading = false;
        MessageHelper.showSnackBarMessage(
            isSuccess: true, message: "Login succsess");
        navService.pushNamedAndRemoveUntil(RouteHelper.dashboard);

        notifyListeners();
      }
    } catch (e) {
      navService.goBack();
      MessageHelper.showSnackBarMessage(
          isSuccess: false, message: "username or password not match");
      _isloading = false;

      notifyListeners();
      rethrow;
    }
  }
}
