import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/view/widget/homescreen/custommaterialbuttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listpages.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomMaterialButtom(
                         // textbutton: controller.bottomappbar[i]['title'],
                         text: controller.bottomnavigationtitle[i]["title"],
                          iconData: controller.bottomnavigationtitle[i]["icon"],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          isSelected: controller.currentPage == i ? true : false);
                }))
              ],
            )));
  }
}