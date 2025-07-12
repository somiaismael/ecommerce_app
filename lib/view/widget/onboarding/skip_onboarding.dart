import 'package:ecommerce/core/constant/roots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.offAllNamed(AppRoutes.login);
      },
      child: Text("11".tr,style: TextStyle(fontWeight: FontWeight.bold),));
  }
}