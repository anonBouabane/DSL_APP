import 'dart:async';

import 'package:dslsale/Routehelper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkToken() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    if (prefers.getString('accessToken') == null) {
      navService.pushNamedAndRemoveUntil(RouteHelper.login);
    } else {
      navService.pushNamedAndRemoveUntil(RouteHelper.dashboard);
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      checkToken();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "DSL",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 65, 236, 255),
                  strokeWidth: 2,
                  backgroundColor: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
