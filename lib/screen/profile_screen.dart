import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/constants/image_paths.dart';
import 'package:tasky_do/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            ImagePaths.back,
            height: 24,
            width: 24,
          ),
        ),
        title: const Text(
          "Edit profile",
          style: TextStyle(
            color: Colors.black,
            fontFamily: FontFamily.medium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "SAVE",
              style: TextStyle(color: ColorConst.primaryColor, fontFamily: FontFamily.medium),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Center(
                child: Container(
                  // color: Colors.red,
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(top: 40),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(ImagePaths.user),
                            alignment: Alignment.center,
                            scale: 2.5,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          ImagePaths.changePhoto,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                        fontFamily: FontFamily.book,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Marry R.Montana",
                          style: TextStyle(
                            fontFamily: FontFamily.medium,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            profileController.showEditDialog(context);
                          },
                          icon: Image.asset(ImagePaths.editUserName, height: 25, width: 25),
                        ),
                      ],
                    ),
                    const Text(
                      "Email ID",
                      style: TextStyle(
                        color: ColorConst.primaryColor,
                        fontFamily: FontFamily.book,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "youremailid@gmail.com",
                      style: TextStyle(
                        fontFamily: FontFamily.medium,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: FontFamily.book,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
