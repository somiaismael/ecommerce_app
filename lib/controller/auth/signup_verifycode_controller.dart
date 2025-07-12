import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/roots.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/remote/auth/verifycodesignupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpVerifycodeController extends GetxController {

  String? email;


   VerifyCodeSignupData verifyCodeSignupData=VerifyCodeSignupData(Get.find());

   Statusrequest statusrequest=Statusrequest.none;




  goToSuccessSignUp(verfiycode)async{
   statusrequest= Statusrequest.loading;
   update();
   var response =await verifyCodeSignupData.addData(email!, verfiycode);
   statusrequest=handlingData(response);
   if(statusrequest == Statusrequest.success){
    if(response["status"]== "success"){
        Get.toNamed(AppRoutes.successSignup);
    }else{
       Get.defaultDialog(title: "warning",middleText: "verfiycode not correct");
        statusrequest= Statusrequest.failure;
    }
   }

   update();
  }

resendCode()async{
   statusrequest= Statusrequest.loading;
   update();
   var response =await verifyCodeSignupData.resendVerfiyCode(email!);
   statusrequest=handlingData(response);
   if(statusrequest == Statusrequest.success){
    if(response["status"]== "success"){
      print("+++++++++++++++++++++++++++++++++++ ${response["status"]}");
        // Get.toNamed(AppRoutes.successSignup);
    }else{
      //  Get.defaultDialog(title: "warning",middleText: "verfiycode not correct");
        statusrequest= Statusrequest.failure;
    }
   }

   update();
  }

  @override
  void onInit() {
     email=  Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {


    super.dispose();
  }
}
