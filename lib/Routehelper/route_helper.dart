import 'package:dslsale/view/Screen/auth/login.dart';
import 'package:dslsale/view/Screen/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static const login = '/login';
  static const dashboard = 'dashboard';

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case dashboard:
        return MaterialPageRoute(builder: (context) => const DashBoardScreen());
      default:
        throw const FormatException('route is not found');
    }
  }
}
