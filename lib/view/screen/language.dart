import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/locallization/local_controller.dart';
import 'package:ecommerce/view/widget/language/button_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
       Container(
        width: double.infinity,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("1".tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
             SizedBox(height: 10,),
                LanguageButton(text: "2".tr,onPressed: (){
              controller.changeLanguage("ar");
              Get.offNamed(AppRoutes.onBoarding);
            },),
           
            LanguageButton(text: "3".tr,onPressed: (){
              controller.changeLanguage("en");
              Get.offNamed(AppRoutes.onBoarding);
            },),
        
               ],),
       )),
    );
  }
}