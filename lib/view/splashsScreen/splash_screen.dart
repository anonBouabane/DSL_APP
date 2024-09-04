import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/login');
      // Provider.of<AuthController>(context,listen: false).validateToken();
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
            child: SizedBox(height: 200,width: 200,
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
