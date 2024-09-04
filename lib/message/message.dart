import 'package:flutter/material.dart';

class MessageHelper {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBarMessage({isSuccess = bool, message = String}) {
    key.currentState!.showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      padding: const EdgeInsets.all(18),
      content: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          backgroundColor: isSuccess ? Colors.green : Colors.red,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}