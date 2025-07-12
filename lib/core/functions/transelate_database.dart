import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

MyServices myServices=Get.find(); 

transelateDataBase(String arabic,String english ){

  if(myServices.sharedPreferences.getString("lang") == "ar"){
    return arabic;
  }else{
    return english;
  }

}