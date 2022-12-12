import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky_do/components/custom_safe_area.dart';
import 'package:tasky_do/constants/color_const.dart';
import 'package:tasky_do/constants/font_family.dart';
import 'package:tasky_do/constants/image_paths.dart';
import 'package:tasky_do/controller/add_task_controller.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddTaskController addTaskController = Get.put(AddTaskController());
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.backGroundColor,
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
            "Tasky-Do",
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
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.book,
                      color: ColorConst.greyColor,
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  cursorColor: ColorConst.primaryColor,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text("Task name ${index + 1}"),
                        leading: Obx(() {
                          return Checkbox(
                            value: addTaskController.listOfBool[index].value,
                            onChanged: (value) {
                              addTaskController.listOfBool[index].value = !addTaskController.listOfBool[index].value;
                            },
                            shape: const CircleBorder(),
                            activeColor: ColorConst.primaryColor,
                          );
                        }),
                        // trailing: PopupMenuButton(
                        //   icon: Image.asset(
                        //     ImagePaths.verticalDots,
                        //     height: 25,
                        //     width: 25,
                        //   ),
                        //   padding: EdgeInsets.zero,
                        //   itemBuilder: (context) {
                        //     return [
                        //       PopupMenuItem(
                        //         child: Row(
                        //           children: [
                        //             Image.asset(ImagePaths.popUpLabel, width: 15, height: 15),
                        //             const SizedBox(width: 10),
                        //             const Text(
                        //               "Labels",
                        //               style: TextStyle(fontFamily: FontFamily.medium, fontSize: 14),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       PopupMenuItem(
                        //         child: Row(
                        //           children: [
                        //             Image.asset(ImagePaths.popUpCalendar, width: 15, height: 15),
                        //             const SizedBox(width: 10),
                        //             const Text(
                        //               "Calendar",
                        //               style: TextStyle(fontFamily: FontFamily.medium, fontSize: 14),
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ];
                        //   },
                        // ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        tileColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Divider(color: ColorConst.greyColor),
                const SizedBox(height: 15),
                const Text(
                  "Completed Task",
                  style: TextStyle(fontFamily: FontFamily.medium, fontSize: 16),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text("Task name ${index + 1}"),
                        leading: Obx(() {
                          return Checkbox(
                            value: addTaskController.completedTask[index].value,
                            onChanged: (value) {
                              addTaskController.completedTask[index].value =
                                  !addTaskController.completedTask[index].value;
                            },
                            shape: const CircleBorder(),
                            activeColor: ColorConst.primaryColor,
                          );
                        }),
                        trailing:  PopupMenuButton(
                          icon: Image.asset(
                            ImagePaths.verticalDots,
                            height: 25,
                            width: 25,
                          ),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Image.asset(ImagePaths.popUpLabel, width: 15, height: 15),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Labels",
                                      style: TextStyle(fontFamily: FontFamily.medium, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Image.asset(ImagePaths.popUpCalendar, width: 15, height: 15),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Calendar",
                                      style: TextStyle(fontFamily: FontFamily.medium, fontSize: 14),
                                    ),
                                  ],
                                ),
                              )
                            ];
                          },
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        tileColor: Colors.white,
                        contentPadding: EdgeInsets.zero,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 56,
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  addTaskController.showBackGroundColorChoiceSheet();
                },
                icon: Image.asset(
                  ImagePaths.addTaskColor,
                  height: 25,
                  width: 25,
                ),
                splashColor: Colors.transparent,
                color: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              IconButton(
                onPressed: () {
                  addTaskController.showLabelChoiceSheet();
                },
                icon: Image.asset(
                  ImagePaths.addTaskLabel,
                  height: 25,
                  width: 25,
                ),
                splashColor: Colors.transparent,
                color: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImagePaths.addTaskFavorite,
                  height: 25,
                  width: 25,
                ),
                splashColor: Colors.transparent,
                color: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              IconButton(
                onPressed: () {
                  addTaskController.showCalendarDialog();
                },
                icon: Image.asset(
                  ImagePaths.addTaskCalendar,
                  height: 25,
                  width: 25,
                ),
                splashColor: Colors.transparent,
                color: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorConst.primaryColor,
          child: Image.asset(
            ImagePaths.plusIcon,
            height: 16,
            width: 16,
          ),
        ),
      ),
    );
  }
}
