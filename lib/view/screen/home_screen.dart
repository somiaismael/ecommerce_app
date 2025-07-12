
import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/view/widget/homescreen/bottomnavigation.dart';
import 'package:ecommerce/view/widget/homescreen/custommaterialbuttom.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(HomeScreenController());
    return  
    GetBuilder<HomeScreenController>(builder: (controller)=>
    Scaffold(
     
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoutes.cart);
      },child: Icon(Icons.shopping_basket,color: Colors.white,),
      backgroundColor: AppColor.primaryColor,
     
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBarHome(),
      body:controller.listpages.elementAt(controller.currentPage)
    )
    )
    ;
  }
}