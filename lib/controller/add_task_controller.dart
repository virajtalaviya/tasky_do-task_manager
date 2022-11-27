import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';

class AddTaskController extends GetxController {
  List<RxBool> listOfBool = List.generate(5, (index) => false.obs);
  List<RxBool> completedTask = List.generate(5, (index) => true.obs);
  List<String> labelList = ["Home", "Office", "Friends"];
  List<Color> fontsLabelColorList = const [
    Color(0xFFFFFFFF),
    Color(0xFFFFCE00),
    Color(0xFF2492FF),
    Color(0xFF180101),
    Color(0xFFFF1686),
    Color(0xFF19C900),
    Color(0xFF7E1AFF),
    Color(0xFFFC2727),
  ];

  RxInt currentIndexForLabel = 0.obs;
  RxInt currentIndexForFont = 0.obs;

  late PageController pageController;
  RxInt currentIndex = 0.obs;
  RxInt currentCalendarIndex = 0.obs;

  List<Color> colorList = const [
    Color(0xFFFFFFFF),
    Color(0xFFFEF4CA),
    Color(0xFFE5F2FF),
    Color(0xFFFEE3F0),
    Color(0xFFEADFF8),
    Color(0xFFF8DFDF),
  ];

  void showCalendarDialog() {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        content: TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.now(),
          lastDay: DateTime(2100),
          calendarStyle: const CalendarStyle(
            canMarkersOverflow: true,
            defaultTextStyle: TextStyle(fontFamily: FontFamily.medium),
            disabledTextStyle: TextStyle(fontFamily: FontFamily.medium, color: ColorConst.primaryColor),
            holidayTextStyle: TextStyle(fontFamily: FontFamily.medium),
            selectedTextStyle: TextStyle(fontFamily: FontFamily.medium),
            todayTextStyle: TextStyle(fontFamily: FontFamily.medium, color: Colors.white),
            todayDecoration: BoxDecoration(shape: BoxShape.circle, color: ColorConst.primaryColor),
            outsideTextStyle: TextStyle(fontFamily: FontFamily.medium, color: ColorConst.primaryColor),
            weekendTextStyle: TextStyle(fontFamily: FontFamily.medium, color: Colors.black),
            selectedDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            tablePadding: EdgeInsets.zero,
          ),
          onDaySelected: (a, b) {},
          // enabledDayPredicate: (a){
          //   print("-------*-----$a");
          //   return true;
          // },
          selectedDayPredicate: (day) {
            if (day.day.isEven) {
              return false;
            } else {
              return true;
            }
          },
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(fontFamily: FontFamily.medium, fontSize: Get.size.width * 0.045),
            leftChevronIcon: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorConst.primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorConst.primaryColor,
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.arrow_back_ios_new_outlined, color: ColorConst.primaryColor),
                // ),
                // IconButton(
                //   onPressed: () {
                //     pageController.previousPage(
                //       duration: const Duration(milliseconds: 500),
                //       curve: Curves.fastOutSlowIn,
                //     );
                //   },
                //   icon: const Icon(Icons.arrow_back_ios_new_outlined, color: ColorConst.primaryColor),
                // ),
              ],
            ),
            rightChevronIcon: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ColorConst.primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      pageController.initialPage + 12,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ColorConst.primaryColor,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     pageController.nextPage(
                //       duration: const Duration(milliseconds: 500),
                //       curve: Curves.fastOutSlowIn,
                //     );
                //   },
                //   icon: const Icon(Icons.arrow_forward_ios_outlined, color: ColorConst.primaryColor),
                // ),
                // IconButton(
                //   onPressed: () {
                //     pageController.animateToPage(
                //       pageController.initialPage + 12,
                //       duration: const Duration(milliseconds: 500),
                //       curve: Curves.fastOutSlowIn,
                //     );
                //   },
                //   icon: const Icon(Icons.arrow_forward_ios_outlined, color: ColorConst.primaryColor),
                // ),
              ],
            ),
            headerPadding: EdgeInsets.zero,
            headerMargin: const EdgeInsets.only(bottom: 20),
            leftChevronMargin: EdgeInsets.zero,
            leftChevronPadding: EdgeInsets.zero,
            rightChevronMargin: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
          ),

          onCalendarCreated: (controller) {
            pageController = controller;
            currentCalendarIndex.value = controller.initialPage;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "SCHEDULED",
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
      ),
    );
  }

  void showCreateLabelDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Label",
              style: TextStyle(
                color: ColorConst.primaryColor,
                fontFamily: FontFamily.book,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xfff5f5f5),
              child: const TextField(
                cursorColor: ColorConst.primaryColor,
                decoration: InputDecoration(
                  hintText: "Add label text",
                  hintStyle: TextStyle(color: ColorConst.greyColor, fontFamily: FontFamily.book),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorConst.primaryColor)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Label Color",
              style: TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.book,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
                children: List.generate(fontsLabelColorList.length, (index) {
              return GestureDetector(
                onTap: () {
                  currentIndexForLabel.value = index;
                },
                child: Obx(() {
                  return currentIndexForLabel.value == index
                      ? Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(
                            left: Get.width * 0.03,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2, color: ColorConst.primaryColor),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: FractionallySizedBox(
                              heightFactor: 0.9, // Adjust those two for the white space
                              widthFactor: 0.9,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: fontsLabelColorList[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(
                            left: Get.width * 0.03,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: fontsLabelColorList[index],
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        );
                }),
              );
            })),
            const SizedBox(height: 10),
            const Text(
              "Fonts color",
              style: TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.book,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              children: List.generate(fontsLabelColorList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    currentIndexForFont.value = index;
                  },
                  child: Obx(() {
                    return currentIndexForFont.value == index
                        ? Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(
                              left: Get.width * 0.03,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2, color: ColorConst.primaryColor),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: FractionallySizedBox(
                                heightFactor: 0.9, // Adjust those two for the white space
                                widthFactor: 0.9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: fontsLabelColorList[index],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(
                              left: Get.width * 0.03,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              color: fontsLabelColorList[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          );
                  }),
                );
              }),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "ADD",
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
      ),
    );
  }

  void showBackGroundColorChoiceSheet() {
    Get.bottomSheet(
      Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Background Color",
                  style: TextStyle(
                    fontFamily: FontFamily.medium,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: colorList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex.value = index;
                    },
                    child: Obx(() {
                      return currentIndex.value == index
                          ? Container(
                              height: 37,
                              width: 37,
                              margin: EdgeInsets.only(left: index == 0 ? 0 : Get.width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 2, color: ColorConst.primaryColor),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: FractionallySizedBox(
                                  heightFactor: 0.9, // Adjust those two for the white space
                                  widthFactor: 0.9,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorList[index],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.only(left: index == 0 ? 0 : Get.width * 0.03),
                              decoration: BoxDecoration(
                                color: colorList[index],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            );
                    }),
                  );
                },
              ),
            ),
            const Divider(color: ColorConst.greyColor),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "DONE",
                style: TextStyle(
                  color: ColorConst.primaryColor,
                  fontFamily: FontFamily.medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLabelChoiceSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Labels",
                    style: TextStyle(
                      fontFamily: FontFamily.medium,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Choose Labels",
                style: TextStyle(
                  color: ColorConst.primaryColor,
                  fontFamily: FontFamily.book,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 10,
                children: List.generate(3 + 1, (index) {
                  if (index == 3) {
                    return InkWell(
                      onTap: () {
                        Get.back();
                        showCreateLabelDialog();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                        decoration: BoxDecoration(
                          color: ColorConst.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "+ Add Tag",
                          style: TextStyle(
                            color: Colors.white, //ColorConst.primaryColor,
                            fontFamily: FontFamily.book,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        labelList[index],
                        style: const TextStyle(
                          color: Colors.white, //ColorConst.primaryColor,
                          fontFamily: FontFamily.book,
                        ),
                      ),
                    );
                  }
                }),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: labelList.length + 1,
              //     scrollDirection: Axis.horizontal,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 15,
              //         decoration: BoxDecoration(
              //           color: index == labelList.length ? ColorConst.primaryColor : Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Text(
              //           index == labelList.length ? "+ Add Tag" : labelList[index],
              //           style: TextStyle(
              //             color: index == labelList.length ? Colors.white : ColorConst.primaryColor,
              //             fontFamily: FontFamily.book,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 30),
              const Text(
                "Selected Label",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.book,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 10,
                children: List.generate(3, (index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      labelList[index],
                      style: const TextStyle(
                        color: Colors.white, //ColorConst.primaryColor,
                        fontFamily: FontFamily.book,
                      ),
                    ),
                  );
                }),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: labelList.length,
              //     scrollDirection: Axis.horizontal,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Container(
              //         color: Colors.white,
              //         child: Text(
              //           labelList[index],
              //           style: const TextStyle(
              //             color: ColorConst.primaryColor,
              //             fontFamily: FontFamily.book,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 30),
              const Divider(color: ColorConst.greyColor),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "DONE",
                    style: TextStyle(
                      color: ColorConst.primaryColor,
                      fontFamily: FontFamily.medium,
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
