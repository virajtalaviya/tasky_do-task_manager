import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/components/custom_snackbar.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/controller/sign_up_controller.dart';
import 'package:tasky_do/screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomSafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Sign Up ",
                          style: TextStyle(
                            fontFamily: FontFamily.medium,
                            fontSize: 16,
                            color: Color(0xff1AAACD),
                          ),
                        ),
                        TextSpan(
                          text: "to get started",
                          style: TextStyle(
                            fontFamily: FontFamily.medium,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 23),
                  TextField(
                    controller: signUpController.nameController,
                    cursorColor: const Color(0xff1AAACD),
                    decoration: const InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(color: Color(0xff7D7D7D), fontSize: 16, fontWeight: FontWeight.w400),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7D7D7D)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1AAACD)),
                      ),
                    ),
                  ),
                  TextField(
                    controller: signUpController.emailController,
                    cursorColor: const Color(0xff1AAACD),
                    decoration: const InputDecoration(
                      hintText: "E-mail ID",
                      hintStyle: TextStyle(color: Color(0xff7D7D7D), fontSize: 16, fontWeight: FontWeight.w400),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7D7D7D)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1AAACD)),
                      ),
                    ),
                  ),
                  TextField(
                    controller: signUpController.passwordController,
                    cursorColor: const Color(0xff1AAACD),
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color(0xff7D7D7D), fontSize: 16, fontWeight: FontWeight.w400),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7D7D7D)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1AAACD)),
                      ),
                    ),
                  ),
                  TextField(
                    controller: signUpController.confirmPasswordController,
                    cursorColor: const Color(0xff1AAACD),
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Color(0xff7D7D7D), fontSize: 16, fontWeight: FontWeight.w400),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7D7D7D)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff1AAACD)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
                  ElevatedButton(
                    onPressed: () {
                      signUpController.signUp();

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xff1AAACD)),
                      fixedSize: MaterialStateProperty.all(Size(width, 44)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: const Text(
                      "SIGN-UP",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontFamily.medium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 23),
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            signUpController.signUpWithGoogle();
                            // signUpController.getUserInfo();
                          },
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                            child: Center(child: Image.asset("asset/Google.png")),
                          ),
                        ),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                            child: Center(child: Image.asset("asset/facebook.png")),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 31),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Member ? ",
                        style: TextStyle(color: Color(0xFF7D7D7D)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignInScreen());
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Color(0xFF1AAACD),
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
      ),
    );
  }
}
