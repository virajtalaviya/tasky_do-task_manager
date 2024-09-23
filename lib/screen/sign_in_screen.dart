import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/controller/sign_in_controller.dart';
import 'package:tasky_do/screen/home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.13,
                ),
                Center(
                  child: Image.asset(
                    "asset/Logo.png",
                    height: 102,
                    width: 102,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hello !",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: FontFamily.medium,
                  ),
                ),
                const Text(
                  "Again Welcome back",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.book,
                  ),
                ),
                const SizedBox(height: 23),
                const TextField(
                  cursorColor: ColorConst.primaryColor,
                  decoration: InputDecoration(
                    hintText: "E-mail ID",
                    hintStyle: TextStyle(color: Color(0xff7D7D7D), fontSize: 16, fontWeight: FontWeight.w400),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff7D7D7D)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ),
                ),
                const TextField(
                  cursorColor: ColorConst.primaryColor,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xff7D7D7D), fontSize: 16, fontWeight: FontWeight.w400),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff7D7D7D)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorConst.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const HomeScreen());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(ColorConst.primaryColor),
                    fixedSize: MaterialStateProperty.all(Size(width, 44)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.medium,
                    ),
                  ),
                ),
                // const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 31),
                const Center(
                  child: Text(
                    "OR Sign Up With",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.medium,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    signInController.googleSignIn();
                  },
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                    child: Center(child: Image.asset("asset/Google.png")),
                  ),
                ),
                // Row(
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         signInController.googleSignIn();
                //       },
                //       child: Expanded(
                //         child: Container(
                //           height: 44,
                //           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                //           child: Image.asset("asset/Google.png"),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 13),
                //     InkWell(
                //       onTap: () {
                //       },
                //       child: Expanded(
                //         child: Container(
                //           height: 44,
                //           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                //           child: Image.asset("asset/facebook.png"),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a Member ? ",
                      style: TextStyle(color: Color(0xFF7D7D7D)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: ColorConst.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
