import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController{
  List<RxBool> listOfBool = List.generate(3, (index) => false.obs);
  late int currentIndex;
  late PageController pageController;
}