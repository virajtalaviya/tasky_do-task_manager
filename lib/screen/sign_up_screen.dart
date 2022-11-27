import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              const TextField(
                cursorColor: Color(0xff1AAACD),
                decoration: InputDecoration(
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
              const TextField(
                cursorColor: Color(0xff1AAACD),
                decoration: InputDecoration(
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
              const TextField(
                cursorColor: Color(0xff1AAACD),
                decoration: InputDecoration(
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
              const TextField(
                cursorColor: Color(0xff1AAACD),
                decoration: InputDecoration(
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
                  Get.to(() => const SignInScreen());
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
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                      child: Image.asset("asset/Google.png"),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                      child: Image.asset("asset/facebook.png"),
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
                    onPressed: () {},
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
    );
  }
}
