import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "asset/Logo.png",
                  height: 153,
                  width: 153,
                ),
                const SizedBox(height: 26),
                const Text(
                  "Tasky-Do",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontFamily.kleeOne,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
