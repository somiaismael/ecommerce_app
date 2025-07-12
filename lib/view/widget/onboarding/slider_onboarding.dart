import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/data/static/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingSlider extends StatelessWidget {
  const OnboardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller=Get.put(OnboardingController());
    return PageView.builder(
     controller: controller.pageController,
      onPageChanged: (value){
        controller.onPageChanged(value);
        
        
      },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Text(onboardingData[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  Image.asset(onboardingData[index].image),
                  Text(onboardingData[index].body,textAlign: TextAlign.center,),
                ],
              ),
                        );
  }
}