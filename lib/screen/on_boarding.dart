import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/constants/custom_clip_path.dart';
import 'package:tasky_do/screen/sign_up_screen.dart';
import 'package:tasky_do/utils/preference_utils.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomSafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: height * 0.8,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xffD1F6FF),
                  // image: DecorationImage(image: AssetImage("asset/on_boarding.png")),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
                ),
              ),
            ),
            Container(
              height: height * 0.75,
              width: width,
              decoration: const BoxDecoration(
                color: ColorConst.primaryColor,
                // image: DecorationImage(image: AssetImage("asset/on_boarding.png")),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
            ),
            Align(
              alignment: const Alignment(-0.3, -0.7),
              child: Image.asset(
                "asset/on_boarding.png",
                height: height * 0.5,
              ),
            ),
            const Align(
              alignment: Alignment(0.65, 0),
              child: Text(
                "Tasky-Do",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.kleeOne,
                  fontSize: 32,
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0.57, 0.3),
              child: Text(
                "Manage your daily\ntask & everything with Taskey-Do",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.kleeOne,
                  fontSize: 18,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SignUpScreen());
                  PreferenceUtils.setBool("showOnBoarding", false);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 44.5)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: const Text(
                  "LET'S START",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamily.medium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
