import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';

class ProfileController extends GetxController {
  TextEditingController controller = TextEditingController();

  void showEditDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Edit User name",
              style: TextStyle(
                color: ColorConst.primaryColor,
                fontFamily: FontFamily.book,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xfff5f5f5),
              child: TextField(
                cursorColor: ColorConst.primaryColor,
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Change User Name",
                  hintStyle: TextStyle(color: ColorConst.greyColor, fontFamily: FontFamily.book),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorConst.primaryColor)),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "CHANGE",
              style: TextStyle(
                color: ColorConst.primaryColor,
                fontFamily: FontFamily.book,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "CANCEL",
              style: TextStyle(
                color: ColorConst.greyColor,
                fontFamily: FontFamily.book,
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
