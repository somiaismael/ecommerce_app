import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/static/onboarding_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  int currentPage = 0;
   late PageController pageController;
   MyServices myServices=Get.find();

  next() {
     currentPage++;
     if(currentPage > onboardingData.length-1 ){
      myServices.sharedPreferences.setString("step", "1");
       Get.offAllNamed(AppRoutes.login);
     }else{

pageController.animateToPage(currentPage, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
     }
      
  }

  onPageChanged(int page) {
    currentPage = page;
    update();
  }

  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }
}
