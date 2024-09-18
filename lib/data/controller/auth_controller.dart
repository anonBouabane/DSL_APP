import 'package:dslsale/Routehelper/route_helper.dart';
import 'package:dslsale/data/Model/auth_model.dart';
import 'package:dslsale/data/repository/auth_repository.dart';
import 'package:dslsale/data/shared/sharedata.dart';
import 'package:dslsale/message/message.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  dynamic _userData;
  dynamic get userData => _userData;
  bool _isloading = false;
  bool get isloading => _isloading;
  final authRepo = AuthRepo();
  Future<void> login({required username, required password}) async {
    _isloading = true;
    try {
      AuthModel authModel =
          await authRepo.login(username: username, password: password);
      navService.goBack();
      if (authModel.resultCode == "OK") {
        _shareprefer("full_name", authModel.fullName);
        _shareprefer("accessToken", authModel.accessToken);
        _shareprefer("role_name", authModel.roleName.toString());
        _shareprefer("depart_name", authModel.departName.toString());

        ShareData.departName = authModel.departName.toString();
        ShareData.roleName = authModel.roleName.toString();
        ShareData.token = authModel.accessToken.toString();
        ShareData.fullName = authModel.fullName.toString();

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

  Future<void> _shareprefer(String key, String value) async {
    final prefer = await SharedPreferences.getInstance();
    prefer.setString(key, value);
  }

  Future<String> getprefer(String key) async {
    final prefer = await SharedPreferences.getInstance();
    String data = '';
    if (prefer.getString(key) != null) {
      data = prefer.getString(key).toString();
    }
    return data;
  }

  setdatafromprefer() async {
    ShareData.departName = await getprefer('depart_name');
    ShareData.roleName = await getprefer('role_name');
    ShareData.fullName = await getprefer('full_name');
    ShareData.token = await getprefer('accessToken');
  }

  Future<void> clearprefers() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    await prefers.clear();
    await navService.pushNamedAndRemoveUntil(RouteHelper.login);
    notifyListeners();
  }
}
