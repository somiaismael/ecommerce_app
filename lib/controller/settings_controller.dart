import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  MyServices myServices=Get.find();

  logOut(){
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}