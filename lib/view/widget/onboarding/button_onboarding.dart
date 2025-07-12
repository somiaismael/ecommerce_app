import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller=Get.put(OnboardingController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
      width: double.infinity,
      child: MaterialButton(
        onPressed: () { 
          controller.next();
        },
        color: AppColor.primaryColor,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text("10".tr,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}