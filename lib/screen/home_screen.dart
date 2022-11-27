import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/controller/home_controller.dart';
import 'package:tasky_do/screen/add_task_screen.dart';
import 'package:tasky_do/screen/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return CustomSafeArea(
      child: Scaffold(
        key: homeController.scaffoldKey,
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              homeController.scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Tasky-Do",
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontFamily.medium,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "asset/search.png",
                height: 24,
                width: 24,
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.to(() => const ProfileScreen());
                },
                child: Row(
                  children: [
                    const SizedBox(width: 17),
                    SizedBox(
                      height: 72,
                      width: 72,
                      child: Stack(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f5f5),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                "asset/user.png",
                                width: 28.8,
                                height: 32,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xfff5f5f5),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "asset/edit_profile.png",
                                  width: 28.8,
                                  height: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "User Name",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorConst.primaryColor,
                            fontFamily: FontFamily.medium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "youremailid@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: FontFamily.book,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: homeController.drawerContent.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.back();
                        homeController.tapEvent(index);
                      },
                      leading: Image.asset(
                        homeController.drawerContent[index]["image"],
                        width: 24,
                        height: 24,
                      ),
                      title: Text(
                        homeController.drawerContent[index]["title"],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          itemCount: 7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 14,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                color: const Color(0xfffef4ca),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          homeController.isFavorite.value = !homeController.isFavorite.value;
                        },
                        splashColor: Colors.transparent,
                        padding: const EdgeInsets.only(top: 7, right: 10),
                        constraints: const BoxConstraints(),
                        color: Colors.transparent,
                        icon: Obx(
                          () {
                            return homeController.isFavorite.value
                                ? Image.asset(
                                    "asset/favorite_filled.png",
                                    width: 20,
                                    height: 20,
                                  )
                                : Image.asset(
                                    "asset/favorite.png",
                                    width: 20,
                                    height: 20,
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Title ${index + 1}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: FontFamily.medium,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "30 Nov 2022",
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontFamily: FontFamily.book,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontFamily.book,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddTaskScreen());
          },
          backgroundColor: ColorConst.primaryColor,
          child: Image.asset(
            "asset/plus_icon.png",
            height: 16,
            width: 16,
          ),
        ),
      ),
    );
  }
}
