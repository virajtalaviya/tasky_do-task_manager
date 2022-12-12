import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/constants/image_paths.dart';
import 'package:tasky_do/controller/today_task_controller.dart';
import 'package:tasky_do/screen/add_task_screen.dart';

class TodayTaskScreen extends StatelessWidget {
  const TodayTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodayTaskController todayTaskController = Get.put(TodayTaskController());
    return CustomSafeArea(
      child: Scaffold(
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
            "Today",
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
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          itemCount: 5,
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
                          todayTaskController.isFavorite.value = !todayTaskController.isFavorite.value;
                        },
                        splashColor: Colors.transparent,
                        padding: const EdgeInsets.only(top: 7, right: 10),
                        constraints: const BoxConstraints(),
                        color: Colors.transparent,
                        icon: Obx(
                          () {
                            return todayTaskController.isFavorite.value
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
