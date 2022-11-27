import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/constants/image_paths.dart';
import 'package:tasky_do/screen/calendar_screen.dart';
import 'package:tasky_do/screen/favorite_screen.dart';
import 'package:tasky_do/screen/today_task_screen.dart';

class HomeController extends GetxController {
  RxBool isFavorite = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> drawerContent = [
    {
      "image": ImagePaths.today,
      "title": "Today",
    },
    {
      "image": ImagePaths.calender,
      "title": "Calender",
    },
    {
      "image": ImagePaths.favoriteDrawer,
      "title": "Favorite",
    },
    {
      "image": ImagePaths.label,
      "title": "labels",
    },
  ];

  tapEvent(int index) {
    switch (index) {
      case 0:
        Get.to(() => const TodayTaskScreen());
        break;
      case 1:
        Get.to(() => const CalendarScreen());
        break;
      case 2:
        Get.to(() => const FavouriteScreen());
        break;
      case 3:
        break;
    }
  }
}
