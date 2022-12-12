import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/constants/image_paths.dart';
import 'package:tasky_do/controller/calendar_controller.dart';
import 'package:tasky_do/screen/add_task_screen.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarController calendarController = Get.put(CalendarController());
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
            "Calendar",
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
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
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
                  titleTextStyle:
                      TextStyle(fontFamily: FontFamily.medium, fontSize: MediaQuery.of(context).size.width * 0.045),
                  leftChevronIcon: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                            color: ColorConst.primaryColor
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          calendarController.pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                            color: ColorConst.primaryColor
                        ),
                      ),
                    ],
                  ),
                  rightChevronIcon: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          calendarController.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                            color: ColorConst.primaryColor
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          calendarController.pageController.animateToPage(
                            calendarController.pageController.initialPage + 12,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                            color: ColorConst.primaryColor
                        ),
                      ),
                    ],
                  ),
                  headerPadding: EdgeInsets.zero,
                  headerMargin: EdgeInsets.zero,
                  leftChevronMargin: EdgeInsets.zero,
                  leftChevronPadding: EdgeInsets.zero,
                  rightChevronMargin: EdgeInsets.zero,
                  rightChevronPadding: EdgeInsets.zero,
                ),
                onCalendarCreated: (controller) {
                  calendarController.pageController = controller;
                  calendarController.currentIndex = controller.initialPage;
                },
              ),
              const Text(
                "Task Title",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: FontFamily.medium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Theme(
                        data: ThemeData(unselectedWidgetColor: ColorConst.primaryColor),
                        child: Obx(() {
                          return Checkbox(
                            value: calendarController.listOfBool[index].value,
                            onChanged: (value) {
                              calendarController.listOfBool[index].value = !calendarController.listOfBool[index].value;
                            },
                            shape: const CircleBorder(),
                            activeColor: ColorConst.primaryColor
                          );
                        }),
                      ),
                      title: Text("Task ${index + 1}"),
                    );
                  },
                ),
              )
            ],
          ),
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
