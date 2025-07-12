import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/data/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingDots extends StatelessWidget {
  const OnboardingDots({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(OnboardingController());
    return     
       GetBuilder<OnboardingController>(builder: (controller)=> Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(onboardingData.length, (i)=>
            AnimatedContainer(duration: Duration(seconds: 2),
            margin: EdgeInsets.only(right: 5),
                  color: Colors.brown,
                  width: controller.currentPage==i? 30 :5,
                  height: 3,
                  
                  ),)
          ],
        )
      )
    ;
  }
}