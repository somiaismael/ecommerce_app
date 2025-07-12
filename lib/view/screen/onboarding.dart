import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/data/static/onboarding_data.dart';
import 'package:ecommerce/view/widget/onboarding/button_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/dots_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/skip_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/slider_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: OnboardingSlider(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
           OnboardingDots(),
           Spacer(),
           OnboardingButton(),
        //   OnboardingSkip()
                  ],
                )
                
                ),
              
            ],
          ),
        )
    ));
  }
}



