import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void displaySnackBar(String message) {
    Get.rawSnackbar(
      message: message,
      margin: const EdgeInsets.all(10),
      borderRadius: 0,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
